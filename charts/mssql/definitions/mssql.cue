// We put Definitions in definitions directory.
// References:
// - https://kubevela.net/docs/platform-engineers/cue/definition-edit
// - https://kubevela.net/docs/platform-engineers/addon/intro#definitions-directoryoptional
"mssql": {
	alias: "mssql"
	annotations: {}
	attributes: workload: type: "autodetects.core.oam.dev"
	description: "MSSQL Server."
	labels: {}
	type: "component"
}

template: {
	parameter: {
		acceptEULA:      string | *"Y"
		collation:       string | *"SQL_Latin1_General_CP1_CI_AS"
		pid:             string | *"Developer"
		image:           string | *"mcr.microsoft.com/mssql/server:2022-latest"
		imagePullPolicy: string | *"IfNotPresent"
		ingress:         {
			enable: true
			host:   string
		} | *{
			enable: false
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
		serviceAccount: password: {
			value?: string
			valueFrom?: secretKeyRef: {
				name: string
				key:  string
			}
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
					securityContext: {
						fsGroup: 10001
					}
					terminationGracePeriodSeconds: parameter.terminationGracePeriodSeconds
					containers: [
						{
							name:            "mssql"
							image:           parameter.image
							imagePullPolicy: parameter.imagePullPolicy

							ports: [
								{
									containerPort: 1433
									name:          "mssql"
								},
							]
							livenessProbe: {
								tcpSocket: {
									port: "mssql"
								}
								initialDelaySeconds: 15
								periodSeconds:       20
							}
							readinessProbe: {
								tcpSocket: {
									port: "mssql"
								}
								initialDelaySeconds: 5
								periodSeconds:       10
							}
							env: [
								{
									name:  "ACCEPT_EULA"
									value: parameter.acceptEULA
								},
								{
									name:  "MSSQL_AGENT_ENABLED"
									value: "1"
								},
								{
									name:  "MSSQL_ENABLE_HADR"
									value: "0"
								},
								{
									name:  "MSSQL_PID"
									value: parameter.pid
								},
								{
									name:  "MSSQL_COLLATION"
									value: parameter.collation
								},
								{
									name: "MSSQL_MEMORY_LIMIT_MB"
									valueFrom: resourceFieldRef: {
										resource: "limits.memory"
										divisor:  "1Mi"
									}
								},
								{
									name: "MSSQL_SA_PASSWORD"
									if parameter.serviceAccount.password != _|_ {
										valueFrom: {
											secretKeyRef: {
												name: context.name + "-sa-password"
												key:  "MSSQL_SA_PASSWORD"
											}
										}
									}
									if parameter.serviceAccount.valueFrom != _|_ {
										valueFrom: parameter.serviceAccount.valueFrom
									}
								},
							]
							resources: parameter.resources
							volumeMounts: [
								{
									"name":      context.name + "-pvc"
									"mountPath": "/var/opt/mssql"
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
		if parameter.serviceAccount.password.value != _|_ {
			"secret": {
				apiVersion: "v1"
				kind:       "Secret"
				metadata: {
					name: context.name + "-sa-password"
				}
				type: "Opaque"
				stringData: {
					MSSQL_SA_PASSWORD: parameter.serviceAccount.password.value
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
						name:       "mssql"
						port:       1433
						targetPort: "mssql"
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
