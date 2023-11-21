import "strconv"

// We put Definitions in definitions directory.
// References:
// - https://kubevela.net/docs/platform-engineers/cue/definition-edit
// - https://kubevela.net/docs/platform-engineers/addon/intro#definitions-directoryoptional
"eventstore": {
	alias: "es"
	annotations: {}
	attributes: workload: type: "autodetects.core.oam.dev"
	description: "Eventstore"
	labels: {}
	type: "component"
}

template: {
	parameter: {
		admin: password: {
			value: string
		} | {
			valueFrom: secretKeyRef: {
				name: string
				key:  string
			}
		}
		ingress: *{
			enable: false
		} | {
			enable: true
			host:   string
			port:   uint16
		}
		image:           string | *"eventstore/eventstore:23.10.0-bookworm-slim"
		imagePullPolicy: string | *"IfNotPresent"
		network: {
			http: {
				port: uint16 | *2113
			}
			replication: {
				ip:   string | *"127.0.0.1"
				port: uint16 | *1112
			}
			externalTCP: {
				port: uint16 | *1113
			}
		}
		resources: {
			limits: {
				cpu:    string | *"1000m"
				memory: string | *"2Gi"
			}
			requests: {
				cpu:    string | *"100m"
				memory: string | *"1Gi"
			}
		}
		security: {
			enable: false
		} | {
			enable: true
		}
		storage:                       string | *"10Gi"
		terminationGracePeriodSeconds: int | *30
	}
	output: {
		apiVersion: "apps/v1"
		kind:       "StatefulSet"
		metadata: name: context.name
		spec: {
			serviceName: context.name
			replicas:    1
			selector: matchLabels: app: context.name
			template: {
				metadata: {
					labels: app: context.name
				}
				spec: {
					terminationGracePeriodSeconds: parameter.terminationGracePeriodSeconds
					containers: [
						{
							name:            "eventstore"
							image:           parameter.image
							imagePullPolicy: parameter.imagePullPolicy

							ports: [
								{
									containerPort: parameter.network.replication.port
									name:          "repl-tcp"
								},
								{
									containerPort: parameter.network.http.port
									name:          "http"
								},
								{
									containerPort: parameter.network.externalTCP.port
									name:          "ext-tcp"
								},
							]
							livenessProbe: {
								httpGet: {
									path: "/stats"
									port: parameter.network.http.port
								}
								initialDelaySeconds: 15
								timeoutSeconds:      5
								periodSeconds:       15
							}
							readinessProbe: {
								httpGet: {
									path: "/stats"
									port: parameter.network.http.port
								}
								initialDelaySeconds: 15
								timeoutSeconds:      5
								periodSeconds:       15
							}
							env: [
								{
									name:  "EVENTSTORE_CLUSTER_SIZE"
									value: "1"
								},
								{
									name:  "EVENTSTORE_RUN_PROJECTIONS"
									value: "All"
								},
								{
									name:  "EVENTSTORE_START_STANDARD_PROJECTIONS"
									value: "true"
								},
								{
									name:  "EVENTSTORE_ENABLE_ATOM_PUB_OVER_HTTP"
									value: "true"
								},
								{
									name:  "EVENTSTORE_ENABLE_EXTERNAL_TCP"
									value: "true"
								},
								{
									name:  "EVENTSTORE_NODE_IP"
									value: "0.0.0.0"
									//valueFrom: fieldRef: fieldPath: "status.podIP"
								},
								{
									name:  "EVENTSTORE_NODE_PORT"
									value: strconv.FormatUint(parameter.network.http.port, 10)
								},
								{
									name:  "EVENTSTORE_REPLICATION_IP"
									value: parameter.network.replication.ip
								},
								{
									name:  "EVENTSTORE_REPLICATION_PORT"
									value: strconv.FormatUint(parameter.network.replication.port, 10)
								},
								if parameter.ingress.enable {
									{
										name:  "EVENTSTORE_NODE_PORT_ADVERTISE_AS"
										value: strconv.FormatUint(parameter.ingress.port, 10)
									}
								},
								if parameter.ingress.enable {
									{
										name:  "EVENTSTORE_NODE_HOST_ADVERTISE_AS"
										value: parameter.ingress.host
									}
								},
								{
									name:  "EVENTSTORE_INSECURE"
									value: strconv.FormatBool(!parameter.security.enable)
								},
								if parameter.security.enable {
									{
										name: "EVENTSTORE_DEFAULT_ADMIN_PASSWORD"
										if parameter.admin.password.value != _|_ {
											valueFrom: {
												secretKeyRef: {
													name: context.name + "-admin-password"
													key:  "EVENTSTORE_DEFAULT_ADMIN_PASSWORD"
												}
											}
										}
										if parameter.serviceAccount.valueFrom != _|_ {
											valueFrom: parameter.admin.password.valueFrom
										}
									}
								},
							]
							resources: parameter.resources
							volumeMounts: [
								{
									"name":      context.name + "-pvc"
									"mountPath": "/var/lib/eventstore"
								},
							]
						},
					]
				}
			}
			volumeClaimTemplates: [
				{
					metadata: {
						name: context.name + "-pvc"
					}
					spec: {
						accessModes: [
							"ReadWriteOnce",
						]
						resources: {
							requests: {
								storage: parameter.storage
							}
						}
					}
				},
			]
		}
	}
	outputs: {
		if parameter.security.enable && parameter.admin.password.value != _|_ {
			"secret": {
				apiVersion: "v1"
				kind:       "Secret"
				metadata: {
					name: context.name + "-admin-password"
				}
				type: "Opaque"
				stringData: {
					EVENTSTORE_DEFAULT_ADMIN_PASSWORD: parameter.serviceAccount.password.value
				}
			}
		}
		if parameter.ingress.enable {
			"ingress": {
				apiVersion: "networking.k8s.io/v1"
				kind:       "Ingress"
				metadata: name: context.name + "-ingress"
				spec: {
					ingressClassName: "nginx"
					rules: [
						{
							host: parameter.ingress.host
							http: {
								paths: [
									{
										path:     "/"
										pathType: "Prefix"
										backend: {
											service: {
												name: context.name
												port: "number": parameter.network.http.port
											}
										}
									},
								]
							}
						},
					]
				}
			}
		}
		service: {
			apiVersion: "v1"
			kind:       "Service"
			metadata: {
				name: context.name
				labels: app: context.name
			}
			spec: {
				type:      "ClusterIP"
				clusterIP: "None"
				ports: [
					{
						name:       "http"
						port:       parameter.network.http.port
						targetPort: "http"
						protocol:   "TCP"
					},
				]
				selector: {
					app: context.name
				}
			}
		}
	}
}
