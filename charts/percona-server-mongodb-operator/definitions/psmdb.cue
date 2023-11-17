// We put Definitions in definitions directory.
// References:
// - https://kubevela.net/docs/platform-engineers/cue/definition-edit
// - https://kubevela.net/docs/platform-engineers/addon/intro#definitions-directoryoptional
"percona-server-mongodb": {
	alias: "psmdb"
	annotations: {}
	attributes: workload: type: "autodetects.core.oam.dev"
	description: "Percona Server MongoDB."
	labels: {}
	type: "component"
}

template: {
	parameter: {
		spec: #PerconaServerMongoDB
	}
	output: {
		apiVersion: "psmdb.percona.com/v1"
		kind:       "PerconaServerMongoDB"
		metadata?: {
			name:      context.name
			namespace: context.namespace
		}
		spec: parameter.spec
	}
	#PerconaServerMongoDB: {
		allowUnsafeConfigurations?: bool
		backup?: {
			annotations?: [string]: string
			containerSecurityContext?: {
				allowPrivilegeEscalation?: bool
				capabilities?: {
					add?: [...string]
					drop?: [...string]
					...
				}
				privileged?:             bool
				procMount?:              string
				readOnlyRootFilesystem?: bool
				runAsGroup?:             int
				runAsNonRoot?:           bool
				runAsUser?:              int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
					...
				}
				seccompProfile?: {
					localhostProfile?: string
					type:              string
					...
				}
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
					...
				}
				...
			}
			enabled: bool
			image:   string
			labels?: [string]: string
			pitr?: {
				compressionLevel?: int
				compressionType?:  string
				enabled?:          bool
				oplogOnly?:        bool
				oplogSpanMin?:     number
				...
			}
			podSecurityContext?: {
				fsGroup?:             int
				fsGroupChangePolicy?: string
				runAsGroup?:          int
				runAsNonRoot?:        bool
				runAsUser?:           int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
					...
				}
				seccompProfile?: {
					localhostProfile?: string
					type:              string
					...
				}
				supplementalGroups?: [...int]
				sysctls?: [...{
					name:  string
					value: string
					...
				}]
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
					...
				}
				...
			}
			resources?: {
				claims?: [...{
					name: string
					...
				}]
				limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				...
			}
			runtimeClassName?:   string
			serviceAccountName?: string
			storages?: [string]: {
				azure?: {
					container?:        string
					credentialsSecret: string
					prefix?:           string
					...
				}
				s3?: {
					bucket:                 string
					credentialsSecret?:     string
					endpointUrl?:           string
					insecureSkipTLSVerify?: bool
					maxUploadParts?:        int
					prefix?:                string
					region?:                string
					serverSideEncryption?: {
						kmsKeyID?:             string
						sseAlgorithm?:         string
						sseCustomerAlgorithm?: string
						sseCustomerKey?:       string
						...
					}
					storageClass?:   string
					uploadPartSize?: int
					...
				}
				type: string
				...
			}
			tasks?: [...{
				compressionLevel?: int
				compressionType?:  string
				enabled:           bool
				keep?:             int
				name:              string
				schedule?:         string
				storageName?:      string
				type?:             "logical" | "physical"
				...
			}]
			...
		}
		clusterServiceDNSMode?:   string
		clusterServiceDNSSuffix?: string
		crVersion?:               string
		ignoreAnnotations?: [...string]
		ignoreLabels?: [...string]
		image:            string
		imagePullPolicy?: string
		imagePullSecrets?: [...{
			name?: string
			...
		}]
		initContainerSecurityContext?: {
			allowPrivilegeEscalation?: bool
			capabilities?: {
				add?: [...string]
				drop?: [...string]
				...
			}
			privileged?:             bool
			procMount?:              string
			readOnlyRootFilesystem?: bool
			runAsGroup?:             int
			runAsNonRoot?:           bool
			runAsUser?:              int
			seLinuxOptions?: {
				level?: string
				role?:  string
				type?:  string
				user?:  string
				...
			}
			seccompProfile?: {
				localhostProfile?: string
				type:              string
				...
			}
			windowsOptions?: {
				gmsaCredentialSpec?:     string
				gmsaCredentialSpecName?: string
				hostProcess?:            bool
				runAsUserName?:          string
				...
			}
			...
		}
		initImage?: string
		multiCluster?: {
			DNSSuffix?: string
			enabled:    bool
			...
		}
		pause?:    bool
		platform?: string
		pmm?: {
			enabled?:      bool
			image:         string
			mongodParams?: string
			mongosParams?: string
			resources?: {
				claims?: [...{
					name: string
					...
				}]
				limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				...
			}
			serverHost?: string
			...
		}
		replsets?: [...{
			affinity?: {
				advanced?: {
					nodeAffinity?: {
						preferredDuringSchedulingIgnoredDuringExecution?: [...{
							preference: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchFields?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								...
							}
							weight: int
							...
						}]
						requiredDuringSchedulingIgnoredDuringExecution?: {
							nodeSelectorTerms: [...{
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchFields?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								...
							}]
							...
						}
						...
					}
					podAffinity?: {
						preferredDuringSchedulingIgnoredDuringExecution?: [...{
							podAffinityTerm: {
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}
							weight: int
							...
						}]
						requiredDuringSchedulingIgnoredDuringExecution?: [...{
							labelSelector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							namespaceSelector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							namespaces?: [...string]
							topologyKey: string
							...
						}]
						...
					}
					podAntiAffinity?: {
						preferredDuringSchedulingIgnoredDuringExecution?: [...{
							podAffinityTerm: {
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}
							weight: int
							...
						}]
						requiredDuringSchedulingIgnoredDuringExecution?: [...{
							labelSelector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							namespaceSelector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							namespaces?: [...string]
							topologyKey: string
							...
						}]
						...
					}
					...
				}
				antiAffinityTopologyKey?: string
				...
			}
			annotations?: [string]: string
			arbiter?: {
				affinity?: {
					advanced?: {
						nodeAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								preference: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: {
								nodeSelectorTerms: [...{
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}]
								...
							}
							...
						}
						podAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						podAntiAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						...
					}
					antiAffinityTopologyKey?: string
					...
				}
				annotations?: [string]: string
				enabled: bool
				labels?: [string]:       string
				nodeSelector?: [string]: string
				podDisruptionBudget?: {
					maxUnavailable?: (int | string) & string
					minAvailable?:   (int | string) & string
					...
				}
				priorityClassName?: string
				resources?: {
					claims?: [...{
						name: string
						...
					}]
					limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				runtimeClassName?:   string
				serviceAccountName?: string
				sidecarPVCs?: [...{
					apiVersion?: string
					kind?:       string
					metadata?: {
						...
					}
					spec?: {
						accessModes?: [...string]
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					status?: {
						accessModes?: [...string]
						allocatedResourceStatuses?: [string]: string
						allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						conditions?: [...{
							lastProbeTime?:      string
							lastTransitionTime?: string
							message?:            string
							reason?:             string
							status:              string
							type:                string
							...
						}]
						phase?: string
						...
					}
					...
				}]
				sidecarVolumes?: [...{
					awsElasticBlockStore?: {
						fsType?:    string
						partition?: int
						readOnly?:  bool
						volumeID:   string
						...
					}
					azureDisk?: {
						cachingMode?: string
						diskName:     string
						diskURI:      string
						fsType?:      string
						kind?:        string
						readOnly?:    bool
						...
					}
					azureFile?: {
						readOnly?:  bool
						secretName: string
						shareName:  string
						...
					}
					cephfs?: {
						monitors: [...string]
						path?:       string
						readOnly?:   bool
						secretFile?: string
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					cinder?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeID: string
						...
					}
					configMap?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						name?:     string
						optional?: bool
						...
					}
					csi?: {
						driver:  string
						fsType?: string
						nodePublishSecretRef?: {
							name?: string
							...
						}
						readOnly?: bool
						volumeAttributes?: [string]: string
						...
					}
					downwardAPI?: {
						defaultMode?: int
						items?: [...{
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							mode?: int
							path:  string
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							...
						}]
						...
					}
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					ephemeral?: {
						volumeClaimTemplate?: {
							metadata?: {
								...
							}
							spec: {
								accessModes?: [...string]
								dataSource?: {
									apiGroup?: string
									kind:      string
									name:      string
									...
								}
								dataSourceRef?: {
									apiGroup?:  string
									kind:       string
									name:       string
									namespace?: string
									...
								}
								resources?: {
									claims?: [...{
										name: string
										...
									}]
									limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									...
								}
								selector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								storageClassName?: string
								volumeMode?:       string
								volumeName?:       string
								...
							}
							...
						}
						...
					}
					fc?: {
						fsType?:   string
						lun?:      int
						readOnly?: bool
						targetWWNs?: [...string]
						wwids?: [...string]
						...
					}
					flexVolume?: {
						driver:  string
						fsType?: string
						options?: [string]: string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						...
					}
					flocker?: {
						datasetName?: string
						datasetUUID?: string
						...
					}
					gcePersistentDisk?: {
						fsType?:    string
						partition?: int
						pdName:     string
						readOnly?:  bool
						...
					}
					gitRepo?: {
						directory?: string
						repository: string
						revision?:  string
						...
					}
					glusterfs?: {
						endpoints: string
						path:      string
						readOnly?: bool
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					iscsi?: {
						chapAuthDiscovery?: bool
						chapAuthSession?:   bool
						fsType?:            string
						initiatorName?:     string
						iqn:                string
						iscsiInterface?:    string
						lun:                int
						portals?: [...string]
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						targetPortal: string
						...
					}
					name: string
					nfs?: {
						path:      string
						readOnly?: bool
						server:    string
						...
					}
					persistentVolumeClaim?: {
						claimName: string
						readOnly?: bool
						...
					}
					photonPersistentDisk?: {
						fsType?: string
						pdID:    string
						...
					}
					portworxVolume?: {
						fsType?:   string
						readOnly?: bool
						volumeID:  string
						...
					}
					projected?: {
						defaultMode?: int
						sources?: [...{
							configMap?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							downwardAPI?: {
								items?: [...{
									fieldRef?: {
										apiVersion?: string
										fieldPath:   string
										...
									}
									mode?: int
									path:  string
									resourceFieldRef?: {
										containerName?: string
										divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										resource:       string
										...
									}
									...
								}]
								...
							}
							secret?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							serviceAccountToken?: {
								audience?:          string
								expirationSeconds?: int
								path:               string
								...
							}
							...
						}]
						...
					}
					quobyte?: {
						group?:    string
						readOnly?: bool
						registry:  string
						tenant?:   string
						user?:     string
						volume:    string
						...
					}
					rbd?: {
						fsType?:  string
						image:    string
						keyring?: string
						monitors: [...string]
						pool?:     string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					scaleIO?: {
						fsType?:           string
						gateway:           string
						protectionDomain?: string
						readOnly?:         bool
						secretRef: {
							name?: string
							...
						}
						sslEnabled?:  bool
						storageMode?: string
						storagePool?: string
						system:       string
						volumeName?:  string
						...
					}
					secret?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						optional?:   bool
						secretName?: string
						...
					}
					storageos?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeName?:      string
						volumeNamespace?: string
						...
					}
					vsphereVolume?: {
						fsType?:            string
						storagePolicyID?:   string
						storagePolicyName?: string
						volumePath:         string
						...
					}
					...
				}]
				sidecars?: [...{
					args?: [...string]
					command?: [...string]
					env?: [...{
						name:   string
						value?: string
						valueFrom?: {
							configMapKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							secretKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							...
						}
						...
					}]
					envFrom?: [...{
						configMapRef?: {
							name?:     string
							optional?: bool
							...
						}
						prefix?: string
						secretRef?: {
							name?:     string
							optional?: bool
							...
						}
						...
					}]
					image?:           string
					imagePullPolicy?: string
					lifecycle?: {
						postStart?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						preStop?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						...
					}
					livenessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					name: string
					ports?: [...{
						containerPort: int
						hostIP?:       string
						hostPort?:     int
						name?:         string
						protocol?:     string | *"TCP"
						...
					}]
					readinessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					resizePolicy?: [...{
						resourceName:  string
						restartPolicy: string
						...
					}]
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					restartPolicy?: string
					securityContext?: {
						allowPrivilegeEscalation?: bool
						capabilities?: {
							add?: [...string]
							drop?: [...string]
							...
						}
						privileged?:             bool
						procMount?:              string
						readOnlyRootFilesystem?: bool
						runAsGroup?:             int
						runAsNonRoot?:           bool
						runAsUser?:              int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					startupProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					stdin?:                    bool
					stdinOnce?:                bool
					terminationMessagePath?:   string
					terminationMessagePolicy?: string
					tty?:                      bool
					volumeDevices?: [...{
						devicePath: string
						name:       string
						...
					}]
					volumeMounts?: [...{
						mountPath:         string
						mountPropagation?: string
						name:              string
						readOnly?:         bool
						subPath?:          string
						subPathExpr?:      string
						...
					}]
					workingDir?: string
					...
				}]
				size:                           int
				terminationGracePeriodSeconds?: int
				tolerations?: [...{
					effect?:            string
					key?:               string
					operator?:          string
					tolerationSeconds?: int
					value?:             string
					...
				}]
				topologySpreadConstraints?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					matchLabelKeys?: [...string]
					maxSkew:             int
					minDomains?:         int
					nodeAffinityPolicy?: string
					nodeTaintsPolicy?:   string
					topologyKey:         string
					whenUnsatisfiable:   string
					...
				}]
				...
			}
			clusterRole?:   string
			configuration?: string
			containerSecurityContext?: {
				allowPrivilegeEscalation?: bool
				capabilities?: {
					add?: [...string]
					drop?: [...string]
					...
				}
				privileged?:             bool
				procMount?:              string
				readOnlyRootFilesystem?: bool
				runAsGroup?:             int
				runAsNonRoot?:           bool
				runAsUser?:              int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
					...
				}
				seccompProfile?: {
					localhostProfile?: string
					type:              string
					...
				}
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
					...
				}
				...
			}
			expose?: {
				enabled:     bool
				exposeType?: string
				loadBalancerSourceRanges?: [...string]
				serviceAnnotations?: [string]: string
				serviceLabels?: [string]:      string
				...
			}
			externalNodes?: [...{
				host:     string
				port?:    int
				priority: int
				votes:    int
				...
			}]
			hostAliases?: [...{
				hostnames?: [...string]
				ip?: string
				...
			}]
			labels?: [string]: string
			livenessProbe?: {
				exec?: {
					command?: [...string]
					...
				}
				failureThreshold?: int
				grpc?: {
					port:     int
					service?: string
					...
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name:  string
						value: string
						...
					}]
					path?:   string
					port:    (int | string) & string
					scheme?: string
					...
				}
				initialDelaySeconds?: int
				periodSeconds?:       int
				startupDelaySeconds?: int
				successThreshold?:    int
				tcpSocket?: {
					host?: string
					port:  (int | string) & string
					...
				}
				terminationGracePeriodSeconds?: int
				timeoutSeconds?:                int
				...
			}
			name?: string
			nodeSelector?: [string]: string
			nonvoting?: {
				affinity?: {
					advanced?: {
						nodeAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								preference: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: {
								nodeSelectorTerms: [...{
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}]
								...
							}
							...
						}
						podAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						podAntiAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						...
					}
					antiAffinityTopologyKey?: string
					...
				}
				annotations?: [string]: string
				configuration?: string
				containerSecurityContext?: {
					allowPrivilegeEscalation?: bool
					capabilities?: {
						add?: [...string]
						drop?: [...string]
						...
					}
					privileged?:             bool
					procMount?:              string
					readOnlyRootFilesystem?: bool
					runAsGroup?:             int
					runAsNonRoot?:           bool
					runAsUser?:              int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				enabled: bool
				labels?: [string]: string
				livenessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					startupDelaySeconds?: int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				nodeSelector?: [string]: string
				podDisruptionBudget?: {
					maxUnavailable?: (int | string) & string
					minAvailable?:   (int | string) & string
					...
				}
				podSecurityContext?: {
					fsGroup?:             int
					fsGroupChangePolicy?: string
					runAsGroup?:          int
					runAsNonRoot?:        bool
					runAsUser?:           int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					supplementalGroups?: [...int]
					sysctls?: [...{
						name:  string
						value: string
						...
					}]
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				priorityClassName?: string
				readinessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				resources?: {
					claims?: [...{
						name: string
						...
					}]
					limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				runtimeClassName?:   string
				serviceAccountName?: string
				sidecarPVCs?: [...{
					apiVersion?: string
					kind?:       string
					metadata?: {
						...
					}
					spec?: {
						accessModes?: [...string]
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					status?: {
						accessModes?: [...string]
						allocatedResourceStatuses?: [string]: string
						allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						conditions?: [...{
							lastProbeTime?:      string
							lastTransitionTime?: string
							message?:            string
							reason?:             string
							status:              string
							type:                string
							...
						}]
						phase?: string
						...
					}
					...
				}]
				sidecarVolumes?: [...{
					awsElasticBlockStore?: {
						fsType?:    string
						partition?: int
						readOnly?:  bool
						volumeID:   string
						...
					}
					azureDisk?: {
						cachingMode?: string
						diskName:     string
						diskURI:      string
						fsType?:      string
						kind?:        string
						readOnly?:    bool
						...
					}
					azureFile?: {
						readOnly?:  bool
						secretName: string
						shareName:  string
						...
					}
					cephfs?: {
						monitors: [...string]
						path?:       string
						readOnly?:   bool
						secretFile?: string
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					cinder?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeID: string
						...
					}
					configMap?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						name?:     string
						optional?: bool
						...
					}
					csi?: {
						driver:  string
						fsType?: string
						nodePublishSecretRef?: {
							name?: string
							...
						}
						readOnly?: bool
						volumeAttributes?: [string]: string
						...
					}
					downwardAPI?: {
						defaultMode?: int
						items?: [...{
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							mode?: int
							path:  string
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							...
						}]
						...
					}
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					ephemeral?: {
						volumeClaimTemplate?: {
							metadata?: {
								...
							}
							spec: {
								accessModes?: [...string]
								dataSource?: {
									apiGroup?: string
									kind:      string
									name:      string
									...
								}
								dataSourceRef?: {
									apiGroup?:  string
									kind:       string
									name:       string
									namespace?: string
									...
								}
								resources?: {
									claims?: [...{
										name: string
										...
									}]
									limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									...
								}
								selector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								storageClassName?: string
								volumeMode?:       string
								volumeName?:       string
								...
							}
							...
						}
						...
					}
					fc?: {
						fsType?:   string
						lun?:      int
						readOnly?: bool
						targetWWNs?: [...string]
						wwids?: [...string]
						...
					}
					flexVolume?: {
						driver:  string
						fsType?: string
						options?: [string]: string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						...
					}
					flocker?: {
						datasetName?: string
						datasetUUID?: string
						...
					}
					gcePersistentDisk?: {
						fsType?:    string
						partition?: int
						pdName:     string
						readOnly?:  bool
						...
					}
					gitRepo?: {
						directory?: string
						repository: string
						revision?:  string
						...
					}
					glusterfs?: {
						endpoints: string
						path:      string
						readOnly?: bool
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					iscsi?: {
						chapAuthDiscovery?: bool
						chapAuthSession?:   bool
						fsType?:            string
						initiatorName?:     string
						iqn:                string
						iscsiInterface?:    string
						lun:                int
						portals?: [...string]
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						targetPortal: string
						...
					}
					name: string
					nfs?: {
						path:      string
						readOnly?: bool
						server:    string
						...
					}
					persistentVolumeClaim?: {
						claimName: string
						readOnly?: bool
						...
					}
					photonPersistentDisk?: {
						fsType?: string
						pdID:    string
						...
					}
					portworxVolume?: {
						fsType?:   string
						readOnly?: bool
						volumeID:  string
						...
					}
					projected?: {
						defaultMode?: int
						sources?: [...{
							configMap?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							downwardAPI?: {
								items?: [...{
									fieldRef?: {
										apiVersion?: string
										fieldPath:   string
										...
									}
									mode?: int
									path:  string
									resourceFieldRef?: {
										containerName?: string
										divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										resource:       string
										...
									}
									...
								}]
								...
							}
							secret?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							serviceAccountToken?: {
								audience?:          string
								expirationSeconds?: int
								path:               string
								...
							}
							...
						}]
						...
					}
					quobyte?: {
						group?:    string
						readOnly?: bool
						registry:  string
						tenant?:   string
						user?:     string
						volume:    string
						...
					}
					rbd?: {
						fsType?:  string
						image:    string
						keyring?: string
						monitors: [...string]
						pool?:     string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					scaleIO?: {
						fsType?:           string
						gateway:           string
						protectionDomain?: string
						readOnly?:         bool
						secretRef: {
							name?: string
							...
						}
						sslEnabled?:  bool
						storageMode?: string
						storagePool?: string
						system:       string
						volumeName?:  string
						...
					}
					secret?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						optional?:   bool
						secretName?: string
						...
					}
					storageos?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeName?:      string
						volumeNamespace?: string
						...
					}
					vsphereVolume?: {
						fsType?:            string
						storagePolicyID?:   string
						storagePolicyName?: string
						volumePath:         string
						...
					}
					...
				}]
				sidecars?: [...{
					args?: [...string]
					command?: [...string]
					env?: [...{
						name:   string
						value?: string
						valueFrom?: {
							configMapKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							secretKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							...
						}
						...
					}]
					envFrom?: [...{
						configMapRef?: {
							name?:     string
							optional?: bool
							...
						}
						prefix?: string
						secretRef?: {
							name?:     string
							optional?: bool
							...
						}
						...
					}]
					image?:           string
					imagePullPolicy?: string
					lifecycle?: {
						postStart?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						preStop?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						...
					}
					livenessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					name: string
					ports?: [...{
						containerPort: int
						hostIP?:       string
						hostPort?:     int
						name?:         string
						protocol?:     string | *"TCP"
						...
					}]
					readinessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					resizePolicy?: [...{
						resourceName:  string
						restartPolicy: string
						...
					}]
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					restartPolicy?: string
					securityContext?: {
						allowPrivilegeEscalation?: bool
						capabilities?: {
							add?: [...string]
							drop?: [...string]
							...
						}
						privileged?:             bool
						procMount?:              string
						readOnlyRootFilesystem?: bool
						runAsGroup?:             int
						runAsNonRoot?:           bool
						runAsUser?:              int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					startupProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					stdin?:                    bool
					stdinOnce?:                bool
					terminationMessagePath?:   string
					terminationMessagePolicy?: string
					tty?:                      bool
					volumeDevices?: [...{
						devicePath: string
						name:       string
						...
					}]
					volumeMounts?: [...{
						mountPath:         string
						mountPropagation?: string
						name:              string
						readOnly?:         bool
						subPath?:          string
						subPathExpr?:      string
						...
					}]
					workingDir?: string
					...
				}]
				size:                           int
				terminationGracePeriodSeconds?: int
				tolerations?: [...{
					effect?:            string
					key?:               string
					operator?:          string
					tolerationSeconds?: int
					value?:             string
					...
				}]
				topologySpreadConstraints?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					matchLabelKeys?: [...string]
					maxSkew:             int
					minDomains?:         int
					nodeAffinityPolicy?: string
					nodeTaintsPolicy?:   string
					topologyKey:         string
					whenUnsatisfiable:   string
					...
				}]
				volumeSpec?: {
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					persistentVolumeClaim?: {
						accessModes?: [...string]
						annotations?: [string]: string
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						labels?: [string]: string
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					...
				}
				...
			}
			podDisruptionBudget?: {
				maxUnavailable?: (int | string) & string
				minAvailable?:   (int | string) & string
				...
			}
			podSecurityContext?: {
				fsGroup?:             int
				fsGroupChangePolicy?: string
				runAsGroup?:          int
				runAsNonRoot?:        bool
				runAsUser?:           int
				seLinuxOptions?: {
					level?: string
					role?:  string
					type?:  string
					user?:  string
					...
				}
				seccompProfile?: {
					localhostProfile?: string
					type:              string
					...
				}
				supplementalGroups?: [...int]
				sysctls?: [...{
					name:  string
					value: string
					...
				}]
				windowsOptions?: {
					gmsaCredentialSpec?:     string
					gmsaCredentialSpecName?: string
					hostProcess?:            bool
					runAsUserName?:          string
					...
				}
				...
			}
			priorityClassName?: string
			readinessProbe?: {
				exec?: {
					command?: [...string]
					...
				}
				failureThreshold?: int
				grpc?: {
					port:     int
					service?: string
					...
				}
				httpGet?: {
					host?: string
					httpHeaders?: [...{
						name:  string
						value: string
						...
					}]
					path?:   string
					port:    (int | string) & string
					scheme?: string
					...
				}
				initialDelaySeconds?: int
				periodSeconds?:       int
				successThreshold?:    int
				tcpSocket?: {
					host?: string
					port:  (int | string) & string
					...
				}
				terminationGracePeriodSeconds?: int
				timeoutSeconds?:                int
				...
			}
			resources?: {
				claims?: [...{
					name: string
					...
				}]
				limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
				...
			}
			runtimeClassName?:   string
			serviceAccountName?: string
			sidecarPVCs?: [...{
				apiVersion?: string
				kind?:       string
				metadata?: {
					...
				}
				spec?: {
					accessModes?: [...string]
					dataSource?: {
						apiGroup?: string
						kind:      string
						name:      string
						...
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind:       string
						name:       string
						namespace?: string
						...
					}
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					selector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					storageClassName?: string
					volumeMode?:       string
					volumeName?:       string
					...
				}
				status?: {
					accessModes?: [...string]
					allocatedResourceStatuses?: [string]: string
					allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					conditions?: [...{
						lastProbeTime?:      string
						lastTransitionTime?: string
						message?:            string
						reason?:             string
						status:              string
						type:                string
						...
					}]
					phase?: string
					...
				}
				...
			}]
			sidecarVolumes?: [...{
				awsElasticBlockStore?: {
					fsType?:    string
					partition?: int
					readOnly?:  bool
					volumeID:   string
					...
				}
				azureDisk?: {
					cachingMode?: string
					diskName:     string
					diskURI:      string
					fsType?:      string
					kind?:        string
					readOnly?:    bool
					...
				}
				azureFile?: {
					readOnly?:  bool
					secretName: string
					shareName:  string
					...
				}
				cephfs?: {
					monitors: [...string]
					path?:       string
					readOnly?:   bool
					secretFile?: string
					secretRef?: {
						name?: string
						...
					}
					user?: string
					...
				}
				cinder?: {
					fsType?:   string
					readOnly?: bool
					secretRef?: {
						name?: string
						...
					}
					volumeID: string
					...
				}
				configMap?: {
					defaultMode?: int
					items?: [...{
						key:   string
						mode?: int
						path:  string
						...
					}]
					name?:     string
					optional?: bool
					...
				}
				csi?: {
					driver:  string
					fsType?: string
					nodePublishSecretRef?: {
						name?: string
						...
					}
					readOnly?: bool
					volumeAttributes?: [string]: string
					...
				}
				downwardAPI?: {
					defaultMode?: int
					items?: [...{
						fieldRef?: {
							apiVersion?: string
							fieldPath:   string
							...
						}
						mode?: int
						path:  string
						resourceFieldRef?: {
							containerName?: string
							divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							resource:       string
							...
						}
						...
					}]
					...
				}
				emptyDir?: {
					medium?:    string
					sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				ephemeral?: {
					volumeClaimTemplate?: {
						metadata?: {
							...
						}
						spec: {
							accessModes?: [...string]
							dataSource?: {
								apiGroup?: string
								kind:      string
								name:      string
								...
							}
							dataSourceRef?: {
								apiGroup?:  string
								kind:       string
								name:       string
								namespace?: string
								...
							}
							resources?: {
								claims?: [...{
									name: string
									...
								}]
								limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								...
							}
							selector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							storageClassName?: string
							volumeMode?:       string
							volumeName?:       string
							...
						}
						...
					}
					...
				}
				fc?: {
					fsType?:   string
					lun?:      int
					readOnly?: bool
					targetWWNs?: [...string]
					wwids?: [...string]
					...
				}
				flexVolume?: {
					driver:  string
					fsType?: string
					options?: [string]: string
					readOnly?: bool
					secretRef?: {
						name?: string
						...
					}
					...
				}
				flocker?: {
					datasetName?: string
					datasetUUID?: string
					...
				}
				gcePersistentDisk?: {
					fsType?:    string
					partition?: int
					pdName:     string
					readOnly?:  bool
					...
				}
				gitRepo?: {
					directory?: string
					repository: string
					revision?:  string
					...
				}
				glusterfs?: {
					endpoints: string
					path:      string
					readOnly?: bool
					...
				}
				hostPath?: {
					path:  string
					type?: string
					...
				}
				iscsi?: {
					chapAuthDiscovery?: bool
					chapAuthSession?:   bool
					fsType?:            string
					initiatorName?:     string
					iqn:                string
					iscsiInterface?:    string
					lun:                int
					portals?: [...string]
					readOnly?: bool
					secretRef?: {
						name?: string
						...
					}
					targetPortal: string
					...
				}
				name: string
				nfs?: {
					path:      string
					readOnly?: bool
					server:    string
					...
				}
				persistentVolumeClaim?: {
					claimName: string
					readOnly?: bool
					...
				}
				photonPersistentDisk?: {
					fsType?: string
					pdID:    string
					...
				}
				portworxVolume?: {
					fsType?:   string
					readOnly?: bool
					volumeID:  string
					...
				}
				projected?: {
					defaultMode?: int
					sources?: [...{
						configMap?: {
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							name?:     string
							optional?: bool
							...
						}
						downwardAPI?: {
							items?: [...{
								fieldRef?: {
									apiVersion?: string
									fieldPath:   string
									...
								}
								mode?: int
								path:  string
								resourceFieldRef?: {
									containerName?: string
									divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									resource:       string
									...
								}
								...
							}]
							...
						}
						secret?: {
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							name?:     string
							optional?: bool
							...
						}
						serviceAccountToken?: {
							audience?:          string
							expirationSeconds?: int
							path:               string
							...
						}
						...
					}]
					...
				}
				quobyte?: {
					group?:    string
					readOnly?: bool
					registry:  string
					tenant?:   string
					user?:     string
					volume:    string
					...
				}
				rbd?: {
					fsType?:  string
					image:    string
					keyring?: string
					monitors: [...string]
					pool?:     string
					readOnly?: bool
					secretRef?: {
						name?: string
						...
					}
					user?: string
					...
				}
				scaleIO?: {
					fsType?:           string
					gateway:           string
					protectionDomain?: string
					readOnly?:         bool
					secretRef: {
						name?: string
						...
					}
					sslEnabled?:  bool
					storageMode?: string
					storagePool?: string
					system:       string
					volumeName?:  string
					...
				}
				secret?: {
					defaultMode?: int
					items?: [...{
						key:   string
						mode?: int
						path:  string
						...
					}]
					optional?:   bool
					secretName?: string
					...
				}
				storageos?: {
					fsType?:   string
					readOnly?: bool
					secretRef?: {
						name?: string
						...
					}
					volumeName?:      string
					volumeNamespace?: string
					...
				}
				vsphereVolume?: {
					fsType?:            string
					storagePolicyID?:   string
					storagePolicyName?: string
					volumePath:         string
					...
				}
				...
			}]
			sidecars?: [...{
				args?: [...string]
				command?: [...string]
				env?: [...{
					name:   string
					value?: string
					valueFrom?: {
						configMapKeyRef?: {
							key:       string
							name?:     string
							optional?: bool
							...
						}
						fieldRef?: {
							apiVersion?: string
							fieldPath:   string
							...
						}
						resourceFieldRef?: {
							containerName?: string
							divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							resource:       string
							...
						}
						secretKeyRef?: {
							key:       string
							name?:     string
							optional?: bool
							...
						}
						...
					}
					...
				}]
				envFrom?: [...{
					configMapRef?: {
						name?:     string
						optional?: bool
						...
					}
					prefix?: string
					secretRef?: {
						name?:     string
						optional?: bool
						...
					}
					...
				}]
				image?:           string
				imagePullPolicy?: string
				lifecycle?: {
					postStart?: {
						exec?: {
							command?: [...string]
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						...
					}
					preStop?: {
						exec?: {
							command?: [...string]
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						...
					}
					...
				}
				livenessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				name: string
				ports?: [...{
					containerPort: int
					hostIP?:       string
					hostPort?:     int
					name?:         string
					protocol?:     string | *"TCP"
					...
				}]
				readinessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				resizePolicy?: [...{
					resourceName:  string
					restartPolicy: string
					...
				}]
				resources?: {
					claims?: [...{
						name: string
						...
					}]
					limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				restartPolicy?: string
				securityContext?: {
					allowPrivilegeEscalation?: bool
					capabilities?: {
						add?: [...string]
						drop?: [...string]
						...
					}
					privileged?:             bool
					procMount?:              string
					readOnlyRootFilesystem?: bool
					runAsGroup?:             int
					runAsNonRoot?:           bool
					runAsUser?:              int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				startupProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				stdin?:                    bool
				stdinOnce?:                bool
				terminationMessagePath?:   string
				terminationMessagePolicy?: string
				tty?:                      bool
				volumeDevices?: [...{
					devicePath: string
					name:       string
					...
				}]
				volumeMounts?: [...{
					mountPath:         string
					mountPropagation?: string
					name:              string
					readOnly?:         bool
					subPath?:          string
					subPathExpr?:      string
					...
				}]
				workingDir?: string
				...
			}]
			size: int
			splitHorizons?: [string]: [string]: string
			storage?: {
				directoryPerDB?: bool
				engine?:         string
				inMemory?: {
					engineConfig?: {
						inMemorySizeRatio?: number
						...
					}
					...
				}
				mmapv1?: {
					nsSize?:     int
					smallfiles?: bool
					...
				}
				syncPeriodSecs?: int
				wiredTiger?: {
					collectionConfig?: {
						blockCompressor?: string
						...
					}
					engineConfig?: {
						cacheSizeRatio?:      number
						directoryForIndexes?: bool
						journalCompressor?:   string
						...
					}
					indexConfig?: {
						prefixCompression?: bool
						...
					}
					...
				}
				...
			}
			terminationGracePeriodSeconds?: int
			tolerations?: [...{
				effect?:            string
				key?:               string
				operator?:          string
				tolerationSeconds?: int
				value?:             string
				...
			}]
			topologySpreadConstraints?: [...{
				labelSelector?: {
					matchExpressions?: [...{
						key:      string
						operator: string
						values?: [...string]
						...
					}]
					matchLabels?: [string]: string
					...
				}
				matchLabelKeys?: [...string]
				maxSkew:             int
				minDomains?:         int
				nodeAffinityPolicy?: string
				nodeTaintsPolicy?:   string
				topologyKey:         string
				whenUnsatisfiable:   string
				...
			}]
			volumeSpec?: {
				emptyDir?: {
					medium?:    string
					sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				hostPath?: {
					path:  string
					type?: string
					...
				}
				persistentVolumeClaim?: {
					accessModes?: [...string]
					annotations?: [string]: string
					dataSource?: {
						apiGroup?: string
						kind:      string
						name:      string
						...
					}
					dataSourceRef?: {
						apiGroup?:  string
						kind:       string
						name:       string
						namespace?: string
						...
					}
					labels?: [string]: string
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					selector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					storageClassName?: string
					volumeMode?:       string
					volumeName?:       string
					...
				}
				...
			}
			...
		}]
		schedulerName?: string
		secrets?: {
			encryptionKey?: string
			ssl?:           string
			sslInternal?:   string
			users?:         string
			vault?:         string
			...
		}
		sharding?: {
			balancer?: {
				enabled?: bool
				...
			}
			configsvrReplSet?: {
				affinity?: {
					advanced?: {
						nodeAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								preference: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: {
								nodeSelectorTerms: [...{
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}]
								...
							}
							...
						}
						podAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						podAntiAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						...
					}
					antiAffinityTopologyKey?: string
					...
				}
				annotations?: [string]: string
				arbiter?: {
					affinity?: {
						advanced?: {
							nodeAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									preference: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchFields?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: {
									nodeSelectorTerms: [...{
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchFields?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										...
									}]
									...
								}
								...
							}
							podAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									podAffinityTerm: {
										labelSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaceSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaces?: [...string]
										topologyKey: string
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: [...{
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}]
								...
							}
							podAntiAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									podAffinityTerm: {
										labelSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaceSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaces?: [...string]
										topologyKey: string
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: [...{
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}]
								...
							}
							...
						}
						antiAffinityTopologyKey?: string
						...
					}
					annotations?: [string]: string
					enabled: bool
					labels?: [string]:       string
					nodeSelector?: [string]: string
					podDisruptionBudget?: {
						maxUnavailable?: (int | string) & string
						minAvailable?:   (int | string) & string
						...
					}
					priorityClassName?: string
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					runtimeClassName?:   string
					serviceAccountName?: string
					sidecarPVCs?: [...{
						apiVersion?: string
						kind?:       string
						metadata?: {
							...
						}
						spec?: {
							accessModes?: [...string]
							dataSource?: {
								apiGroup?: string
								kind:      string
								name:      string
								...
							}
							dataSourceRef?: {
								apiGroup?:  string
								kind:       string
								name:       string
								namespace?: string
								...
							}
							resources?: {
								claims?: [...{
									name: string
									...
								}]
								limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								...
							}
							selector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							storageClassName?: string
							volumeMode?:       string
							volumeName?:       string
							...
						}
						status?: {
							accessModes?: [...string]
							allocatedResourceStatuses?: [string]: string
							allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							conditions?: [...{
								lastProbeTime?:      string
								lastTransitionTime?: string
								message?:            string
								reason?:             string
								status:              string
								type:                string
								...
							}]
							phase?: string
							...
						}
						...
					}]
					sidecarVolumes?: [...{
						awsElasticBlockStore?: {
							fsType?:    string
							partition?: int
							readOnly?:  bool
							volumeID:   string
							...
						}
						azureDisk?: {
							cachingMode?: string
							diskName:     string
							diskURI:      string
							fsType?:      string
							kind?:        string
							readOnly?:    bool
							...
						}
						azureFile?: {
							readOnly?:  bool
							secretName: string
							shareName:  string
							...
						}
						cephfs?: {
							monitors: [...string]
							path?:       string
							readOnly?:   bool
							secretFile?: string
							secretRef?: {
								name?: string
								...
							}
							user?: string
							...
						}
						cinder?: {
							fsType?:   string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							volumeID: string
							...
						}
						configMap?: {
							defaultMode?: int
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							name?:     string
							optional?: bool
							...
						}
						csi?: {
							driver:  string
							fsType?: string
							nodePublishSecretRef?: {
								name?: string
								...
							}
							readOnly?: bool
							volumeAttributes?: [string]: string
							...
						}
						downwardAPI?: {
							defaultMode?: int
							items?: [...{
								fieldRef?: {
									apiVersion?: string
									fieldPath:   string
									...
								}
								mode?: int
								path:  string
								resourceFieldRef?: {
									containerName?: string
									divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									resource:       string
									...
								}
								...
							}]
							...
						}
						emptyDir?: {
							medium?:    string
							sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						ephemeral?: {
							volumeClaimTemplate?: {
								metadata?: {
									...
								}
								spec: {
									accessModes?: [...string]
									dataSource?: {
										apiGroup?: string
										kind:      string
										name:      string
										...
									}
									dataSourceRef?: {
										apiGroup?:  string
										kind:       string
										name:       string
										namespace?: string
										...
									}
									resources?: {
										claims?: [...{
											name: string
											...
										}]
										limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										...
									}
									selector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									storageClassName?: string
									volumeMode?:       string
									volumeName?:       string
									...
								}
								...
							}
							...
						}
						fc?: {
							fsType?:   string
							lun?:      int
							readOnly?: bool
							targetWWNs?: [...string]
							wwids?: [...string]
							...
						}
						flexVolume?: {
							driver:  string
							fsType?: string
							options?: [string]: string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							...
						}
						flocker?: {
							datasetName?: string
							datasetUUID?: string
							...
						}
						gcePersistentDisk?: {
							fsType?:    string
							partition?: int
							pdName:     string
							readOnly?:  bool
							...
						}
						gitRepo?: {
							directory?: string
							repository: string
							revision?:  string
							...
						}
						glusterfs?: {
							endpoints: string
							path:      string
							readOnly?: bool
							...
						}
						hostPath?: {
							path:  string
							type?: string
							...
						}
						iscsi?: {
							chapAuthDiscovery?: bool
							chapAuthSession?:   bool
							fsType?:            string
							initiatorName?:     string
							iqn:                string
							iscsiInterface?:    string
							lun:                int
							portals?: [...string]
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							targetPortal: string
							...
						}
						name: string
						nfs?: {
							path:      string
							readOnly?: bool
							server:    string
							...
						}
						persistentVolumeClaim?: {
							claimName: string
							readOnly?: bool
							...
						}
						photonPersistentDisk?: {
							fsType?: string
							pdID:    string
							...
						}
						portworxVolume?: {
							fsType?:   string
							readOnly?: bool
							volumeID:  string
							...
						}
						projected?: {
							defaultMode?: int
							sources?: [...{
								configMap?: {
									items?: [...{
										key:   string
										mode?: int
										path:  string
										...
									}]
									name?:     string
									optional?: bool
									...
								}
								downwardAPI?: {
									items?: [...{
										fieldRef?: {
											apiVersion?: string
											fieldPath:   string
											...
										}
										mode?: int
										path:  string
										resourceFieldRef?: {
											containerName?: string
											divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											resource:       string
											...
										}
										...
									}]
									...
								}
								secret?: {
									items?: [...{
										key:   string
										mode?: int
										path:  string
										...
									}]
									name?:     string
									optional?: bool
									...
								}
								serviceAccountToken?: {
									audience?:          string
									expirationSeconds?: int
									path:               string
									...
								}
								...
							}]
							...
						}
						quobyte?: {
							group?:    string
							readOnly?: bool
							registry:  string
							tenant?:   string
							user?:     string
							volume:    string
							...
						}
						rbd?: {
							fsType?:  string
							image:    string
							keyring?: string
							monitors: [...string]
							pool?:     string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							user?: string
							...
						}
						scaleIO?: {
							fsType?:           string
							gateway:           string
							protectionDomain?: string
							readOnly?:         bool
							secretRef: {
								name?: string
								...
							}
							sslEnabled?:  bool
							storageMode?: string
							storagePool?: string
							system:       string
							volumeName?:  string
							...
						}
						secret?: {
							defaultMode?: int
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							optional?:   bool
							secretName?: string
							...
						}
						storageos?: {
							fsType?:   string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							volumeName?:      string
							volumeNamespace?: string
							...
						}
						vsphereVolume?: {
							fsType?:            string
							storagePolicyID?:   string
							storagePolicyName?: string
							volumePath:         string
							...
						}
						...
					}]
					sidecars?: [...{
						args?: [...string]
						command?: [...string]
						env?: [...{
							name:   string
							value?: string
							valueFrom?: {
								configMapKeyRef?: {
									key:       string
									name?:     string
									optional?: bool
									...
								}
								fieldRef?: {
									apiVersion?: string
									fieldPath:   string
									...
								}
								resourceFieldRef?: {
									containerName?: string
									divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									resource:       string
									...
								}
								secretKeyRef?: {
									key:       string
									name?:     string
									optional?: bool
									...
								}
								...
							}
							...
						}]
						envFrom?: [...{
							configMapRef?: {
								name?:     string
								optional?: bool
								...
							}
							prefix?: string
							secretRef?: {
								name?:     string
								optional?: bool
								...
							}
							...
						}]
						image?:           string
						imagePullPolicy?: string
						lifecycle?: {
							postStart?: {
								exec?: {
									command?: [...string]
									...
								}
								httpGet?: {
									host?: string
									httpHeaders?: [...{
										name:  string
										value: string
										...
									}]
									path?:   string
									port:    (int | string) & string
									scheme?: string
									...
								}
								tcpSocket?: {
									host?: string
									port:  (int | string) & string
									...
								}
								...
							}
							preStop?: {
								exec?: {
									command?: [...string]
									...
								}
								httpGet?: {
									host?: string
									httpHeaders?: [...{
										name:  string
										value: string
										...
									}]
									path?:   string
									port:    (int | string) & string
									scheme?: string
									...
								}
								tcpSocket?: {
									host?: string
									port:  (int | string) & string
									...
								}
								...
							}
							...
						}
						livenessProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						name: string
						ports?: [...{
							containerPort: int
							hostIP?:       string
							hostPort?:     int
							name?:         string
							protocol?:     string | *"TCP"
							...
						}]
						readinessProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						resizePolicy?: [...{
							resourceName:  string
							restartPolicy: string
							...
						}]
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						restartPolicy?: string
						securityContext?: {
							allowPrivilegeEscalation?: bool
							capabilities?: {
								add?: [...string]
								drop?: [...string]
								...
							}
							privileged?:             bool
							procMount?:              string
							readOnlyRootFilesystem?: bool
							runAsGroup?:             int
							runAsNonRoot?:           bool
							runAsUser?:              int
							seLinuxOptions?: {
								level?: string
								role?:  string
								type?:  string
								user?:  string
								...
							}
							seccompProfile?: {
								localhostProfile?: string
								type:              string
								...
							}
							windowsOptions?: {
								gmsaCredentialSpec?:     string
								gmsaCredentialSpecName?: string
								hostProcess?:            bool
								runAsUserName?:          string
								...
							}
							...
						}
						startupProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						stdin?:                    bool
						stdinOnce?:                bool
						terminationMessagePath?:   string
						terminationMessagePolicy?: string
						tty?:                      bool
						volumeDevices?: [...{
							devicePath: string
							name:       string
							...
						}]
						volumeMounts?: [...{
							mountPath:         string
							mountPropagation?: string
							name:              string
							readOnly?:         bool
							subPath?:          string
							subPathExpr?:      string
							...
						}]
						workingDir?: string
						...
					}]
					size:                           int
					terminationGracePeriodSeconds?: int
					tolerations?: [...{
						effect?:            string
						key?:               string
						operator?:          string
						tolerationSeconds?: int
						value?:             string
						...
					}]
					topologySpreadConstraints?: [...{
						labelSelector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						matchLabelKeys?: [...string]
						maxSkew:             int
						minDomains?:         int
						nodeAffinityPolicy?: string
						nodeTaintsPolicy?:   string
						topologyKey:         string
						whenUnsatisfiable:   string
						...
					}]
					...
				}
				clusterRole?:   string
				configuration?: string
				containerSecurityContext?: {
					allowPrivilegeEscalation?: bool
					capabilities?: {
						add?: [...string]
						drop?: [...string]
						...
					}
					privileged?:             bool
					procMount?:              string
					readOnlyRootFilesystem?: bool
					runAsGroup?:             int
					runAsNonRoot?:           bool
					runAsUser?:              int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				expose?: {
					enabled:     bool
					exposeType?: string
					loadBalancerSourceRanges?: [...string]
					serviceAnnotations?: [string]: string
					serviceLabels?: [string]:      string
					...
				}
				externalNodes?: [...{
					host:     string
					port?:    int
					priority: int
					votes:    int
					...
				}]
				hostAliases?: [...{
					hostnames?: [...string]
					ip?: string
					...
				}]
				labels?: [string]: string
				livenessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					startupDelaySeconds?: int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				name?: string
				nodeSelector?: [string]: string
				nonvoting?: {
					affinity?: {
						advanced?: {
							nodeAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									preference: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchFields?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: {
									nodeSelectorTerms: [...{
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchFields?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										...
									}]
									...
								}
								...
							}
							podAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									podAffinityTerm: {
										labelSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaceSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaces?: [...string]
										topologyKey: string
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: [...{
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}]
								...
							}
							podAntiAffinity?: {
								preferredDuringSchedulingIgnoredDuringExecution?: [...{
									podAffinityTerm: {
										labelSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaceSelector?: {
											matchExpressions?: [...{
												key:      string
												operator: string
												values?: [...string]
												...
											}]
											matchLabels?: [string]: string
											...
										}
										namespaces?: [...string]
										topologyKey: string
										...
									}
									weight: int
									...
								}]
								requiredDuringSchedulingIgnoredDuringExecution?: [...{
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}]
								...
							}
							...
						}
						antiAffinityTopologyKey?: string
						...
					}
					annotations?: [string]: string
					configuration?: string
					containerSecurityContext?: {
						allowPrivilegeEscalation?: bool
						capabilities?: {
							add?: [...string]
							drop?: [...string]
							...
						}
						privileged?:             bool
						procMount?:              string
						readOnlyRootFilesystem?: bool
						runAsGroup?:             int
						runAsNonRoot?:           bool
						runAsUser?:              int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					enabled: bool
					labels?: [string]: string
					livenessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						startupDelaySeconds?: int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					nodeSelector?: [string]: string
					podDisruptionBudget?: {
						maxUnavailable?: (int | string) & string
						minAvailable?:   (int | string) & string
						...
					}
					podSecurityContext?: {
						fsGroup?:             int
						fsGroupChangePolicy?: string
						runAsGroup?:          int
						runAsNonRoot?:        bool
						runAsUser?:           int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						supplementalGroups?: [...int]
						sysctls?: [...{
							name:  string
							value: string
							...
						}]
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					priorityClassName?: string
					readinessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					runtimeClassName?:   string
					serviceAccountName?: string
					sidecarPVCs?: [...{
						apiVersion?: string
						kind?:       string
						metadata?: {
							...
						}
						spec?: {
							accessModes?: [...string]
							dataSource?: {
								apiGroup?: string
								kind:      string
								name:      string
								...
							}
							dataSourceRef?: {
								apiGroup?:  string
								kind:       string
								name:       string
								namespace?: string
								...
							}
							resources?: {
								claims?: [...{
									name: string
									...
								}]
								limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								...
							}
							selector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							storageClassName?: string
							volumeMode?:       string
							volumeName?:       string
							...
						}
						status?: {
							accessModes?: [...string]
							allocatedResourceStatuses?: [string]: string
							allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							conditions?: [...{
								lastProbeTime?:      string
								lastTransitionTime?: string
								message?:            string
								reason?:             string
								status:              string
								type:                string
								...
							}]
							phase?: string
							...
						}
						...
					}]
					sidecarVolumes?: [...{
						awsElasticBlockStore?: {
							fsType?:    string
							partition?: int
							readOnly?:  bool
							volumeID:   string
							...
						}
						azureDisk?: {
							cachingMode?: string
							diskName:     string
							diskURI:      string
							fsType?:      string
							kind?:        string
							readOnly?:    bool
							...
						}
						azureFile?: {
							readOnly?:  bool
							secretName: string
							shareName:  string
							...
						}
						cephfs?: {
							monitors: [...string]
							path?:       string
							readOnly?:   bool
							secretFile?: string
							secretRef?: {
								name?: string
								...
							}
							user?: string
							...
						}
						cinder?: {
							fsType?:   string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							volumeID: string
							...
						}
						configMap?: {
							defaultMode?: int
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							name?:     string
							optional?: bool
							...
						}
						csi?: {
							driver:  string
							fsType?: string
							nodePublishSecretRef?: {
								name?: string
								...
							}
							readOnly?: bool
							volumeAttributes?: [string]: string
							...
						}
						downwardAPI?: {
							defaultMode?: int
							items?: [...{
								fieldRef?: {
									apiVersion?: string
									fieldPath:   string
									...
								}
								mode?: int
								path:  string
								resourceFieldRef?: {
									containerName?: string
									divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									resource:       string
									...
								}
								...
							}]
							...
						}
						emptyDir?: {
							medium?:    string
							sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						ephemeral?: {
							volumeClaimTemplate?: {
								metadata?: {
									...
								}
								spec: {
									accessModes?: [...string]
									dataSource?: {
										apiGroup?: string
										kind:      string
										name:      string
										...
									}
									dataSourceRef?: {
										apiGroup?:  string
										kind:       string
										name:       string
										namespace?: string
										...
									}
									resources?: {
										claims?: [...{
											name: string
											...
										}]
										limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										...
									}
									selector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									storageClassName?: string
									volumeMode?:       string
									volumeName?:       string
									...
								}
								...
							}
							...
						}
						fc?: {
							fsType?:   string
							lun?:      int
							readOnly?: bool
							targetWWNs?: [...string]
							wwids?: [...string]
							...
						}
						flexVolume?: {
							driver:  string
							fsType?: string
							options?: [string]: string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							...
						}
						flocker?: {
							datasetName?: string
							datasetUUID?: string
							...
						}
						gcePersistentDisk?: {
							fsType?:    string
							partition?: int
							pdName:     string
							readOnly?:  bool
							...
						}
						gitRepo?: {
							directory?: string
							repository: string
							revision?:  string
							...
						}
						glusterfs?: {
							endpoints: string
							path:      string
							readOnly?: bool
							...
						}
						hostPath?: {
							path:  string
							type?: string
							...
						}
						iscsi?: {
							chapAuthDiscovery?: bool
							chapAuthSession?:   bool
							fsType?:            string
							initiatorName?:     string
							iqn:                string
							iscsiInterface?:    string
							lun:                int
							portals?: [...string]
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							targetPortal: string
							...
						}
						name: string
						nfs?: {
							path:      string
							readOnly?: bool
							server:    string
							...
						}
						persistentVolumeClaim?: {
							claimName: string
							readOnly?: bool
							...
						}
						photonPersistentDisk?: {
							fsType?: string
							pdID:    string
							...
						}
						portworxVolume?: {
							fsType?:   string
							readOnly?: bool
							volumeID:  string
							...
						}
						projected?: {
							defaultMode?: int
							sources?: [...{
								configMap?: {
									items?: [...{
										key:   string
										mode?: int
										path:  string
										...
									}]
									name?:     string
									optional?: bool
									...
								}
								downwardAPI?: {
									items?: [...{
										fieldRef?: {
											apiVersion?: string
											fieldPath:   string
											...
										}
										mode?: int
										path:  string
										resourceFieldRef?: {
											containerName?: string
											divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											resource:       string
											...
										}
										...
									}]
									...
								}
								secret?: {
									items?: [...{
										key:   string
										mode?: int
										path:  string
										...
									}]
									name?:     string
									optional?: bool
									...
								}
								serviceAccountToken?: {
									audience?:          string
									expirationSeconds?: int
									path:               string
									...
								}
								...
							}]
							...
						}
						quobyte?: {
							group?:    string
							readOnly?: bool
							registry:  string
							tenant?:   string
							user?:     string
							volume:    string
							...
						}
						rbd?: {
							fsType?:  string
							image:    string
							keyring?: string
							monitors: [...string]
							pool?:     string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							user?: string
							...
						}
						scaleIO?: {
							fsType?:           string
							gateway:           string
							protectionDomain?: string
							readOnly?:         bool
							secretRef: {
								name?: string
								...
							}
							sslEnabled?:  bool
							storageMode?: string
							storagePool?: string
							system:       string
							volumeName?:  string
							...
						}
						secret?: {
							defaultMode?: int
							items?: [...{
								key:   string
								mode?: int
								path:  string
								...
							}]
							optional?:   bool
							secretName?: string
							...
						}
						storageos?: {
							fsType?:   string
							readOnly?: bool
							secretRef?: {
								name?: string
								...
							}
							volumeName?:      string
							volumeNamespace?: string
							...
						}
						vsphereVolume?: {
							fsType?:            string
							storagePolicyID?:   string
							storagePolicyName?: string
							volumePath:         string
							...
						}
						...
					}]
					sidecars?: [...{
						args?: [...string]
						command?: [...string]
						env?: [...{
							name:   string
							value?: string
							valueFrom?: {
								configMapKeyRef?: {
									key:       string
									name?:     string
									optional?: bool
									...
								}
								fieldRef?: {
									apiVersion?: string
									fieldPath:   string
									...
								}
								resourceFieldRef?: {
									containerName?: string
									divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									resource:       string
									...
								}
								secretKeyRef?: {
									key:       string
									name?:     string
									optional?: bool
									...
								}
								...
							}
							...
						}]
						envFrom?: [...{
							configMapRef?: {
								name?:     string
								optional?: bool
								...
							}
							prefix?: string
							secretRef?: {
								name?:     string
								optional?: bool
								...
							}
							...
						}]
						image?:           string
						imagePullPolicy?: string
						lifecycle?: {
							postStart?: {
								exec?: {
									command?: [...string]
									...
								}
								httpGet?: {
									host?: string
									httpHeaders?: [...{
										name:  string
										value: string
										...
									}]
									path?:   string
									port:    (int | string) & string
									scheme?: string
									...
								}
								tcpSocket?: {
									host?: string
									port:  (int | string) & string
									...
								}
								...
							}
							preStop?: {
								exec?: {
									command?: [...string]
									...
								}
								httpGet?: {
									host?: string
									httpHeaders?: [...{
										name:  string
										value: string
										...
									}]
									path?:   string
									port:    (int | string) & string
									scheme?: string
									...
								}
								tcpSocket?: {
									host?: string
									port:  (int | string) & string
									...
								}
								...
							}
							...
						}
						livenessProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						name: string
						ports?: [...{
							containerPort: int
							hostIP?:       string
							hostPort?:     int
							name?:         string
							protocol?:     string | *"TCP"
							...
						}]
						readinessProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						resizePolicy?: [...{
							resourceName:  string
							restartPolicy: string
							...
						}]
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						restartPolicy?: string
						securityContext?: {
							allowPrivilegeEscalation?: bool
							capabilities?: {
								add?: [...string]
								drop?: [...string]
								...
							}
							privileged?:             bool
							procMount?:              string
							readOnlyRootFilesystem?: bool
							runAsGroup?:             int
							runAsNonRoot?:           bool
							runAsUser?:              int
							seLinuxOptions?: {
								level?: string
								role?:  string
								type?:  string
								user?:  string
								...
							}
							seccompProfile?: {
								localhostProfile?: string
								type:              string
								...
							}
							windowsOptions?: {
								gmsaCredentialSpec?:     string
								gmsaCredentialSpecName?: string
								hostProcess?:            bool
								runAsUserName?:          string
								...
							}
							...
						}
						startupProbe?: {
							exec?: {
								command?: [...string]
								...
							}
							failureThreshold?: int
							grpc?: {
								port:     int
								service?: string
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							initialDelaySeconds?: int
							periodSeconds?:       int
							successThreshold?:    int
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							terminationGracePeriodSeconds?: int
							timeoutSeconds?:                int
							...
						}
						stdin?:                    bool
						stdinOnce?:                bool
						terminationMessagePath?:   string
						terminationMessagePolicy?: string
						tty?:                      bool
						volumeDevices?: [...{
							devicePath: string
							name:       string
							...
						}]
						volumeMounts?: [...{
							mountPath:         string
							mountPropagation?: string
							name:              string
							readOnly?:         bool
							subPath?:          string
							subPathExpr?:      string
							...
						}]
						workingDir?: string
						...
					}]
					size:                           int
					terminationGracePeriodSeconds?: int
					tolerations?: [...{
						effect?:            string
						key?:               string
						operator?:          string
						tolerationSeconds?: int
						value?:             string
						...
					}]
					topologySpreadConstraints?: [...{
						labelSelector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						matchLabelKeys?: [...string]
						maxSkew:             int
						minDomains?:         int
						nodeAffinityPolicy?: string
						nodeTaintsPolicy?:   string
						topologyKey:         string
						whenUnsatisfiable:   string
						...
					}]
					volumeSpec?: {
						emptyDir?: {
							medium?:    string
							sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						hostPath?: {
							path:  string
							type?: string
							...
						}
						persistentVolumeClaim?: {
							accessModes?: [...string]
							annotations?: [string]: string
							dataSource?: {
								apiGroup?: string
								kind:      string
								name:      string
								...
							}
							dataSourceRef?: {
								apiGroup?:  string
								kind:       string
								name:       string
								namespace?: string
								...
							}
							labels?: [string]: string
							resources?: {
								claims?: [...{
									name: string
									...
								}]
								limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								...
							}
							selector?: {
								matchExpressions?: [...{
									key:      string
									operator: string
									values?: [...string]
									...
								}]
								matchLabels?: [string]: string
								...
							}
							storageClassName?: string
							volumeMode?:       string
							volumeName?:       string
							...
						}
						...
					}
					...
				}
				podDisruptionBudget?: {
					maxUnavailable?: (int | string) & string
					minAvailable?:   (int | string) & string
					...
				}
				podSecurityContext?: {
					fsGroup?:             int
					fsGroupChangePolicy?: string
					runAsGroup?:          int
					runAsNonRoot?:        bool
					runAsUser?:           int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					supplementalGroups?: [...int]
					sysctls?: [...{
						name:  string
						value: string
						...
					}]
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				priorityClassName?: string
				readinessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				resources?: {
					claims?: [...{
						name: string
						...
					}]
					limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				runtimeClassName?:   string
				serviceAccountName?: string
				sidecarPVCs?: [...{
					apiVersion?: string
					kind?:       string
					metadata?: {
						...
					}
					spec?: {
						accessModes?: [...string]
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					status?: {
						accessModes?: [...string]
						allocatedResourceStatuses?: [string]: string
						allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						conditions?: [...{
							lastProbeTime?:      string
							lastTransitionTime?: string
							message?:            string
							reason?:             string
							status:              string
							type:                string
							...
						}]
						phase?: string
						...
					}
					...
				}]
				sidecarVolumes?: [...{
					awsElasticBlockStore?: {
						fsType?:    string
						partition?: int
						readOnly?:  bool
						volumeID:   string
						...
					}
					azureDisk?: {
						cachingMode?: string
						diskName:     string
						diskURI:      string
						fsType?:      string
						kind?:        string
						readOnly?:    bool
						...
					}
					azureFile?: {
						readOnly?:  bool
						secretName: string
						shareName:  string
						...
					}
					cephfs?: {
						monitors: [...string]
						path?:       string
						readOnly?:   bool
						secretFile?: string
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					cinder?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeID: string
						...
					}
					configMap?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						name?:     string
						optional?: bool
						...
					}
					csi?: {
						driver:  string
						fsType?: string
						nodePublishSecretRef?: {
							name?: string
							...
						}
						readOnly?: bool
						volumeAttributes?: [string]: string
						...
					}
					downwardAPI?: {
						defaultMode?: int
						items?: [...{
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							mode?: int
							path:  string
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							...
						}]
						...
					}
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					ephemeral?: {
						volumeClaimTemplate?: {
							metadata?: {
								...
							}
							spec: {
								accessModes?: [...string]
								dataSource?: {
									apiGroup?: string
									kind:      string
									name:      string
									...
								}
								dataSourceRef?: {
									apiGroup?:  string
									kind:       string
									name:       string
									namespace?: string
									...
								}
								resources?: {
									claims?: [...{
										name: string
										...
									}]
									limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									...
								}
								selector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								storageClassName?: string
								volumeMode?:       string
								volumeName?:       string
								...
							}
							...
						}
						...
					}
					fc?: {
						fsType?:   string
						lun?:      int
						readOnly?: bool
						targetWWNs?: [...string]
						wwids?: [...string]
						...
					}
					flexVolume?: {
						driver:  string
						fsType?: string
						options?: [string]: string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						...
					}
					flocker?: {
						datasetName?: string
						datasetUUID?: string
						...
					}
					gcePersistentDisk?: {
						fsType?:    string
						partition?: int
						pdName:     string
						readOnly?:  bool
						...
					}
					gitRepo?: {
						directory?: string
						repository: string
						revision?:  string
						...
					}
					glusterfs?: {
						endpoints: string
						path:      string
						readOnly?: bool
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					iscsi?: {
						chapAuthDiscovery?: bool
						chapAuthSession?:   bool
						fsType?:            string
						initiatorName?:     string
						iqn:                string
						iscsiInterface?:    string
						lun:                int
						portals?: [...string]
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						targetPortal: string
						...
					}
					name: string
					nfs?: {
						path:      string
						readOnly?: bool
						server:    string
						...
					}
					persistentVolumeClaim?: {
						claimName: string
						readOnly?: bool
						...
					}
					photonPersistentDisk?: {
						fsType?: string
						pdID:    string
						...
					}
					portworxVolume?: {
						fsType?:   string
						readOnly?: bool
						volumeID:  string
						...
					}
					projected?: {
						defaultMode?: int
						sources?: [...{
							configMap?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							downwardAPI?: {
								items?: [...{
									fieldRef?: {
										apiVersion?: string
										fieldPath:   string
										...
									}
									mode?: int
									path:  string
									resourceFieldRef?: {
										containerName?: string
										divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										resource:       string
										...
									}
									...
								}]
								...
							}
							secret?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							serviceAccountToken?: {
								audience?:          string
								expirationSeconds?: int
								path:               string
								...
							}
							...
						}]
						...
					}
					quobyte?: {
						group?:    string
						readOnly?: bool
						registry:  string
						tenant?:   string
						user?:     string
						volume:    string
						...
					}
					rbd?: {
						fsType?:  string
						image:    string
						keyring?: string
						monitors: [...string]
						pool?:     string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					scaleIO?: {
						fsType?:           string
						gateway:           string
						protectionDomain?: string
						readOnly?:         bool
						secretRef: {
							name?: string
							...
						}
						sslEnabled?:  bool
						storageMode?: string
						storagePool?: string
						system:       string
						volumeName?:  string
						...
					}
					secret?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						optional?:   bool
						secretName?: string
						...
					}
					storageos?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeName?:      string
						volumeNamespace?: string
						...
					}
					vsphereVolume?: {
						fsType?:            string
						storagePolicyID?:   string
						storagePolicyName?: string
						volumePath:         string
						...
					}
					...
				}]
				sidecars?: [...{
					args?: [...string]
					command?: [...string]
					env?: [...{
						name:   string
						value?: string
						valueFrom?: {
							configMapKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							secretKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							...
						}
						...
					}]
					envFrom?: [...{
						configMapRef?: {
							name?:     string
							optional?: bool
							...
						}
						prefix?: string
						secretRef?: {
							name?:     string
							optional?: bool
							...
						}
						...
					}]
					image?:           string
					imagePullPolicy?: string
					lifecycle?: {
						postStart?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						preStop?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						...
					}
					livenessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					name: string
					ports?: [...{
						containerPort: int
						hostIP?:       string
						hostPort?:     int
						name?:         string
						protocol?:     string | *"TCP"
						...
					}]
					readinessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					resizePolicy?: [...{
						resourceName:  string
						restartPolicy: string
						...
					}]
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					restartPolicy?: string
					securityContext?: {
						allowPrivilegeEscalation?: bool
						capabilities?: {
							add?: [...string]
							drop?: [...string]
							...
						}
						privileged?:             bool
						procMount?:              string
						readOnlyRootFilesystem?: bool
						runAsGroup?:             int
						runAsNonRoot?:           bool
						runAsUser?:              int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					startupProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					stdin?:                    bool
					stdinOnce?:                bool
					terminationMessagePath?:   string
					terminationMessagePolicy?: string
					tty?:                      bool
					volumeDevices?: [...{
						devicePath: string
						name:       string
						...
					}]
					volumeMounts?: [...{
						mountPath:         string
						mountPropagation?: string
						name:              string
						readOnly?:         bool
						subPath?:          string
						subPathExpr?:      string
						...
					}]
					workingDir?: string
					...
				}]
				size: int
				splitHorizons?: [string]: [string]: string
				storage?: {
					directoryPerDB?: bool
					engine?:         string
					inMemory?: {
						engineConfig?: {
							inMemorySizeRatio?: number
							...
						}
						...
					}
					mmapv1?: {
						nsSize?:     int
						smallfiles?: bool
						...
					}
					syncPeriodSecs?: int
					wiredTiger?: {
						collectionConfig?: {
							blockCompressor?: string
							...
						}
						engineConfig?: {
							cacheSizeRatio?:      number
							directoryForIndexes?: bool
							journalCompressor?:   string
							...
						}
						indexConfig?: {
							prefixCompression?: bool
							...
						}
						...
					}
					...
				}
				terminationGracePeriodSeconds?: int
				tolerations?: [...{
					effect?:            string
					key?:               string
					operator?:          string
					tolerationSeconds?: int
					value?:             string
					...
				}]
				topologySpreadConstraints?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					matchLabelKeys?: [...string]
					maxSkew:             int
					minDomains?:         int
					nodeAffinityPolicy?: string
					nodeTaintsPolicy?:   string
					topologyKey:         string
					whenUnsatisfiable:   string
					...
				}]
				volumeSpec?: {
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					persistentVolumeClaim?: {
						accessModes?: [...string]
						annotations?: [string]: string
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						labels?: [string]: string
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					...
				}
				...
			}
			enabled: bool
			mongos?: {
				affinity?: {
					advanced?: {
						nodeAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								preference: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: {
								nodeSelectorTerms: [...{
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchFields?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									...
								}]
								...
							}
							...
						}
						podAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						podAntiAffinity?: {
							preferredDuringSchedulingIgnoredDuringExecution?: [...{
								podAffinityTerm: {
									labelSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaceSelector?: {
										matchExpressions?: [...{
											key:      string
											operator: string
											values?: [...string]
											...
										}]
										matchLabels?: [string]: string
										...
									}
									namespaces?: [...string]
									topologyKey: string
									...
								}
								weight: int
								...
							}]
							requiredDuringSchedulingIgnoredDuringExecution?: [...{
								labelSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaceSelector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								namespaces?: [...string]
								topologyKey: string
								...
							}]
							...
						}
						...
					}
					antiAffinityTopologyKey?: string
					...
				}
				annotations?: [string]: string
				configuration?: string
				containerSecurityContext?: {
					allowPrivilegeEscalation?: bool
					capabilities?: {
						add?: [...string]
						drop?: [...string]
						...
					}
					privileged?:             bool
					procMount?:              string
					readOnlyRootFilesystem?: bool
					runAsGroup?:             int
					runAsNonRoot?:           bool
					runAsUser?:              int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				expose?: {
					exposeType?: string
					loadBalancerSourceRanges?: [...string]
					serviceAnnotations?: [string]: string
					serviceLabels?: [string]:      string
					servicePerPod?: bool
					...
				}
				hostAliases?: [...{
					hostnames?: [...string]
					ip?: string
					...
				}]
				hostPort?: int
				labels?: [string]: string
				livenessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					startupDelaySeconds?: int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				nodeSelector?: [string]: string
				podDisruptionBudget?: {
					maxUnavailable?: (int | string) & string
					minAvailable?:   (int | string) & string
					...
				}
				podSecurityContext?: {
					fsGroup?:             int
					fsGroupChangePolicy?: string
					runAsGroup?:          int
					runAsNonRoot?:        bool
					runAsUser?:           int
					seLinuxOptions?: {
						level?: string
						role?:  string
						type?:  string
						user?:  string
						...
					}
					seccompProfile?: {
						localhostProfile?: string
						type:              string
						...
					}
					supplementalGroups?: [...int]
					sysctls?: [...{
						name:  string
						value: string
						...
					}]
					windowsOptions?: {
						gmsaCredentialSpec?:     string
						gmsaCredentialSpecName?: string
						hostProcess?:            bool
						runAsUserName?:          string
						...
					}
					...
				}
				port?:              int
				priorityClassName?: string
				readinessProbe?: {
					exec?: {
						command?: [...string]
						...
					}
					failureThreshold?: int
					grpc?: {
						port:     int
						service?: string
						...
					}
					httpGet?: {
						host?: string
						httpHeaders?: [...{
							name:  string
							value: string
							...
						}]
						path?:   string
						port:    (int | string) & string
						scheme?: string
						...
					}
					initialDelaySeconds?: int
					periodSeconds?:       int
					successThreshold?:    int
					tcpSocket?: {
						host?: string
						port:  (int | string) & string
						...
					}
					terminationGracePeriodSeconds?: int
					timeoutSeconds?:                int
					...
				}
				resources?: {
					claims?: [...{
						name: string
						...
					}]
					limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					...
				}
				runtimeClassName?:   string
				serviceAccountName?: string
				setParameter?: {
					cursorTimeoutMillis?: int
					...
				}
				sidecarPVCs?: [...{
					apiVersion?: string
					kind?:       string
					metadata?: {
						...
					}
					spec?: {
						accessModes?: [...string]
						dataSource?: {
							apiGroup?: string
							kind:      string
							name:      string
							...
						}
						dataSourceRef?: {
							apiGroup?:  string
							kind:       string
							name:       string
							namespace?: string
							...
						}
						resources?: {
							claims?: [...{
								name: string
								...
							}]
							limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
							...
						}
						selector?: {
							matchExpressions?: [...{
								key:      string
								operator: string
								values?: [...string]
								...
							}]
							matchLabels?: [string]: string
							...
						}
						storageClassName?: string
						volumeMode?:       string
						volumeName?:       string
						...
					}
					status?: {
						accessModes?: [...string]
						allocatedResourceStatuses?: [string]: string
						allocatedResources?: [string]:        (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						capacity?: [string]:                  (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						conditions?: [...{
							lastProbeTime?:      string
							lastTransitionTime?: string
							message?:            string
							reason?:             string
							status:              string
							type:                string
							...
						}]
						phase?: string
						...
					}
					...
				}]
				sidecarVolumes?: [...{
					awsElasticBlockStore?: {
						fsType?:    string
						partition?: int
						readOnly?:  bool
						volumeID:   string
						...
					}
					azureDisk?: {
						cachingMode?: string
						diskName:     string
						diskURI:      string
						fsType?:      string
						kind?:        string
						readOnly?:    bool
						...
					}
					azureFile?: {
						readOnly?:  bool
						secretName: string
						shareName:  string
						...
					}
					cephfs?: {
						monitors: [...string]
						path?:       string
						readOnly?:   bool
						secretFile?: string
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					cinder?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeID: string
						...
					}
					configMap?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						name?:     string
						optional?: bool
						...
					}
					csi?: {
						driver:  string
						fsType?: string
						nodePublishSecretRef?: {
							name?: string
							...
						}
						readOnly?: bool
						volumeAttributes?: [string]: string
						...
					}
					downwardAPI?: {
						defaultMode?: int
						items?: [...{
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							mode?: int
							path:  string
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							...
						}]
						...
					}
					emptyDir?: {
						medium?:    string
						sizeLimit?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					ephemeral?: {
						volumeClaimTemplate?: {
							metadata?: {
								...
							}
							spec: {
								accessModes?: [...string]
								dataSource?: {
									apiGroup?: string
									kind:      string
									name:      string
									...
								}
								dataSourceRef?: {
									apiGroup?:  string
									kind:       string
									name:       string
									namespace?: string
									...
								}
								resources?: {
									claims?: [...{
										name: string
										...
									}]
									limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
									...
								}
								selector?: {
									matchExpressions?: [...{
										key:      string
										operator: string
										values?: [...string]
										...
									}]
									matchLabels?: [string]: string
									...
								}
								storageClassName?: string
								volumeMode?:       string
								volumeName?:       string
								...
							}
							...
						}
						...
					}
					fc?: {
						fsType?:   string
						lun?:      int
						readOnly?: bool
						targetWWNs?: [...string]
						wwids?: [...string]
						...
					}
					flexVolume?: {
						driver:  string
						fsType?: string
						options?: [string]: string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						...
					}
					flocker?: {
						datasetName?: string
						datasetUUID?: string
						...
					}
					gcePersistentDisk?: {
						fsType?:    string
						partition?: int
						pdName:     string
						readOnly?:  bool
						...
					}
					gitRepo?: {
						directory?: string
						repository: string
						revision?:  string
						...
					}
					glusterfs?: {
						endpoints: string
						path:      string
						readOnly?: bool
						...
					}
					hostPath?: {
						path:  string
						type?: string
						...
					}
					iscsi?: {
						chapAuthDiscovery?: bool
						chapAuthSession?:   bool
						fsType?:            string
						initiatorName?:     string
						iqn:                string
						iscsiInterface?:    string
						lun:                int
						portals?: [...string]
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						targetPortal: string
						...
					}
					name: string
					nfs?: {
						path:      string
						readOnly?: bool
						server:    string
						...
					}
					persistentVolumeClaim?: {
						claimName: string
						readOnly?: bool
						...
					}
					photonPersistentDisk?: {
						fsType?: string
						pdID:    string
						...
					}
					portworxVolume?: {
						fsType?:   string
						readOnly?: bool
						volumeID:  string
						...
					}
					projected?: {
						defaultMode?: int
						sources?: [...{
							configMap?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							downwardAPI?: {
								items?: [...{
									fieldRef?: {
										apiVersion?: string
										fieldPath:   string
										...
									}
									mode?: int
									path:  string
									resourceFieldRef?: {
										containerName?: string
										divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										resource:       string
										...
									}
									...
								}]
								...
							}
							secret?: {
								items?: [...{
									key:   string
									mode?: int
									path:  string
									...
								}]
								name?:     string
								optional?: bool
								...
							}
							serviceAccountToken?: {
								audience?:          string
								expirationSeconds?: int
								path:               string
								...
							}
							...
						}]
						...
					}
					quobyte?: {
						group?:    string
						readOnly?: bool
						registry:  string
						tenant?:   string
						user?:     string
						volume:    string
						...
					}
					rbd?: {
						fsType?:  string
						image:    string
						keyring?: string
						monitors: [...string]
						pool?:     string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						user?: string
						...
					}
					scaleIO?: {
						fsType?:           string
						gateway:           string
						protectionDomain?: string
						readOnly?:         bool
						secretRef: {
							name?: string
							...
						}
						sslEnabled?:  bool
						storageMode?: string
						storagePool?: string
						system:       string
						volumeName?:  string
						...
					}
					secret?: {
						defaultMode?: int
						items?: [...{
							key:   string
							mode?: int
							path:  string
							...
						}]
						optional?:   bool
						secretName?: string
						...
					}
					storageos?: {
						fsType?:   string
						readOnly?: bool
						secretRef?: {
							name?: string
							...
						}
						volumeName?:      string
						volumeNamespace?: string
						...
					}
					vsphereVolume?: {
						fsType?:            string
						storagePolicyID?:   string
						storagePolicyName?: string
						volumePath:         string
						...
					}
					...
				}]
				sidecars?: [...{
					args?: [...string]
					command?: [...string]
					env?: [...{
						name:   string
						value?: string
						valueFrom?: {
							configMapKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							fieldRef?: {
								apiVersion?: string
								fieldPath:   string
								...
							}
							resourceFieldRef?: {
								containerName?: string
								divisor?:       (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
								resource:       string
								...
							}
							secretKeyRef?: {
								key:       string
								name?:     string
								optional?: bool
								...
							}
							...
						}
						...
					}]
					envFrom?: [...{
						configMapRef?: {
							name?:     string
							optional?: bool
							...
						}
						prefix?: string
						secretRef?: {
							name?:     string
							optional?: bool
							...
						}
						...
					}]
					image?:           string
					imagePullPolicy?: string
					lifecycle?: {
						postStart?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						preStop?: {
							exec?: {
								command?: [...string]
								...
							}
							httpGet?: {
								host?: string
								httpHeaders?: [...{
									name:  string
									value: string
									...
								}]
								path?:   string
								port:    (int | string) & string
								scheme?: string
								...
							}
							tcpSocket?: {
								host?: string
								port:  (int | string) & string
								...
							}
							...
						}
						...
					}
					livenessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					name: string
					ports?: [...{
						containerPort: int
						hostIP?:       string
						hostPort?:     int
						name?:         string
						protocol?:     string | *"TCP"
						...
					}]
					readinessProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					resizePolicy?: [...{
						resourceName:  string
						restartPolicy: string
						...
					}]
					resources?: {
						claims?: [...{
							name: string
							...
						}]
						limits?: [string]:   (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						requests?: [string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
						...
					}
					restartPolicy?: string
					securityContext?: {
						allowPrivilegeEscalation?: bool
						capabilities?: {
							add?: [...string]
							drop?: [...string]
							...
						}
						privileged?:             bool
						procMount?:              string
						readOnlyRootFilesystem?: bool
						runAsGroup?:             int
						runAsNonRoot?:           bool
						runAsUser?:              int
						seLinuxOptions?: {
							level?: string
							role?:  string
							type?:  string
							user?:  string
							...
						}
						seccompProfile?: {
							localhostProfile?: string
							type:              string
							...
						}
						windowsOptions?: {
							gmsaCredentialSpec?:     string
							gmsaCredentialSpecName?: string
							hostProcess?:            bool
							runAsUserName?:          string
							...
						}
						...
					}
					startupProbe?: {
						exec?: {
							command?: [...string]
							...
						}
						failureThreshold?: int
						grpc?: {
							port:     int
							service?: string
							...
						}
						httpGet?: {
							host?: string
							httpHeaders?: [...{
								name:  string
								value: string
								...
							}]
							path?:   string
							port:    (int | string) & string
							scheme?: string
							...
						}
						initialDelaySeconds?: int
						periodSeconds?:       int
						successThreshold?:    int
						tcpSocket?: {
							host?: string
							port:  (int | string) & string
							...
						}
						terminationGracePeriodSeconds?: int
						timeoutSeconds?:                int
						...
					}
					stdin?:                    bool
					stdinOnce?:                bool
					terminationMessagePath?:   string
					terminationMessagePolicy?: string
					tty?:                      bool
					volumeDevices?: [...{
						devicePath: string
						name:       string
						...
					}]
					volumeMounts?: [...{
						mountPath:         string
						mountPropagation?: string
						name:              string
						readOnly?:         bool
						subPath?:          string
						subPathExpr?:      string
						...
					}]
					workingDir?: string
					...
				}]
				size?:                          int
				terminationGracePeriodSeconds?: int
				tolerations?: [...{
					effect?:            string
					key?:               string
					operator?:          string
					tolerationSeconds?: int
					value?:             string
					...
				}]
				topologySpreadConstraints?: [...{
					labelSelector?: {
						matchExpressions?: [...{
							key:      string
							operator: string
							values?: [...string]
							...
						}]
						matchLabels?: [string]: string
						...
					}
					matchLabelKeys?: [...string]
					maxSkew:             int
					minDomains?:         int
					nodeAffinityPolicy?: string
					nodeTaintsPolicy?:   string
					topologyKey:         string
					whenUnsatisfiable:   string
					...
				}]
				...
			}
			...
		}
		tls?: {
			certValidityDuration?: string
			...
		}
		unmanaged?:      bool
		updateStrategy?: string
		upgradeOptions?: {
			apply?:                  string
			schedule?:               string
			setFCV?:                 bool
			versionServiceEndpoint?: string
			...
		}
		...
	}
}
