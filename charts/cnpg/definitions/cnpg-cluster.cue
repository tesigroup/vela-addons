import "strings"

// We put Definitions in definitions directory.
// References:
// - https://kubevela.net/docs/platform-engineers/cue/definition-edit
// - https://kubevela.net/docs/platform-engineers/addon/intro#definitions-directoryoptional
"cnpg-cluster": {
	alias: "cnpgc"
	annotations: {}
	attributes: workload: type: "autodetects.core.oam.dev"
	description: "Cnpg cluster."
	labels: {}
	type: "component"
}
template: {
	parameter: {
		spec: #Cluster
	}
	output: {
		apiVersion: "postgresql.cnpg.io/v1"
		kind:       "Cluster"
		metadata?: {
			name:      context.name
			namespace: context.namespace
		}
		spec: parameter.spec
		...
	}
	#Cluster: {
		// Affinity/Anti-affinity rules for Pods
		affinity?: {
			// AdditionalPodAffinity allows to specify pod affinity terms to
			// be passed to all the cluster's pods.
			additionalPodAffinity?: {
				// The scheduler will prefer to schedule pods to nodes that
				// satisfy the affinity expressions specified by this field, but
				// it may choose a node that violates one or more of the
				// expressions. The node that is most preferred is the one with
				// the greatest sum of weights, i.e. for each node that meets all
				// of the scheduling requirements (resource request,
				// requiredDuringScheduling affinity expressions, etc.), compute
				// a sum by iterating through the elements of this field and
				// adding "weight" to the sum if the node has pods which matches
				// the corresponding podAffinityTerm; the node(s) with the
				// highest sum are the most preferred.
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					// Required. A pod affinity term, associated with the
					// corresponding weight.
					podAffinityTerm: {
						// A label query over a set of resources, in this case pods.
						labelSelector?: {
							// matchExpressions is a list of label selector requirements. The
							// requirements are ANDed.
							matchExpressions?: [...{
								// key is the label key that the selector applies to.
								key: string

								// operator represents a key's relationship to a set of values.
								// Valid operators are In, NotIn, Exists and DoesNotExist.
								operator: string

								// values is an array of string values. If the operator is In or
								// NotIn, the values array must be non-empty. If the operator is
								// Exists or DoesNotExist, the values array must be empty. This
								// array is replaced during a strategic merge patch.
								values?: [...string]
								...
							}]

							// matchLabels is a map of {key,value} pairs. A single {key,value}
							// in the matchLabels map is equivalent to an element of
							// matchExpressions, whose key field is "key", the operator is
							// "In", and the values array contains only "value". The
							// requirements are ANDed.
							matchLabels?: {
								[string]: string
							}
							...
						}

						// A label query over the set of namespaces that the term applies
						// to. The term is applied to the union of the namespaces
						// selected by this field and the ones listed in the namespaces
						// field. null selector and null or empty namespaces list means
						// "this pod's namespace". An empty selector ({}) matches all
						// namespaces.
						namespaceSelector?: {
							// matchExpressions is a list of label selector requirements. The
							// requirements are ANDed.
							matchExpressions?: [...{
								// key is the label key that the selector applies to.
								key: string

								// operator represents a key's relationship to a set of values.
								// Valid operators are In, NotIn, Exists and DoesNotExist.
								operator: string

								// values is an array of string values. If the operator is In or
								// NotIn, the values array must be non-empty. If the operator is
								// Exists or DoesNotExist, the values array must be empty. This
								// array is replaced during a strategic merge patch.
								values?: [...string]
								...
							}]

							// matchLabels is a map of {key,value} pairs. A single {key,value}
							// in the matchLabels map is equivalent to an element of
							// matchExpressions, whose key field is "key", the operator is
							// "In", and the values array contains only "value". The
							// requirements are ANDed.
							matchLabels?: {
								[string]: string
							}
							...
						}

						// namespaces specifies a static list of namespace names that the
						// term applies to. The term is applied to the union of the
						// namespaces listed in this field and the ones selected by
						// namespaceSelector. null or empty namespaces list and null
						// namespaceSelector means "this pod's namespace".
						namespaces?: [...string]

						// This pod should be co-located (affinity) or not co-located
						// (anti-affinity) with the pods matching the labelSelector in
						// the specified namespaces, where co-located is defined as
						// running on a node whose value of the label with key
						// topologyKey matches that of any node on which any of the
						// selected pods is running. Empty topologyKey is not allowed.
						topologyKey: string
						...
					}

					// weight associated with matching the corresponding
					// podAffinityTerm, in the range 1-100.
					weight: int
					...
				}]

				// If the affinity requirements specified by this field are not
				// met at scheduling time, the pod will not be scheduled onto the
				// node. If the affinity requirements specified by this field
				// cease to be met at some point during pod execution (e.g. due
				// to a pod label update), the system may or may not try to
				// eventually evict the pod from its node. When there are
				// multiple elements, the lists of nodes corresponding to each
				// podAffinityTerm are intersected, i.e. all terms must be
				// satisfied.
				requiredDuringSchedulingIgnoredDuringExecution?: [...{
					// A label query over a set of resources, in this case pods.
					labelSelector?: {
						// matchExpressions is a list of label selector requirements. The
						// requirements are ANDed.
						matchExpressions?: [...{
							// key is the label key that the selector applies to.
							key: string

							// operator represents a key's relationship to a set of values.
							// Valid operators are In, NotIn, Exists and DoesNotExist.
							operator: string

							// values is an array of string values. If the operator is In or
							// NotIn, the values array must be non-empty. If the operator is
							// Exists or DoesNotExist, the values array must be empty. This
							// array is replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// matchLabels is a map of {key,value} pairs. A single {key,value}
						// in the matchLabels map is equivalent to an element of
						// matchExpressions, whose key field is "key", the operator is
						// "In", and the values array contains only "value". The
						// requirements are ANDed.
						matchLabels?: {
							[string]: string
						}
						...
					}

					// A label query over the set of namespaces that the term applies
					// to. The term is applied to the union of the namespaces
					// selected by this field and the ones listed in the namespaces
					// field. null selector and null or empty namespaces list means
					// "this pod's namespace". An empty selector ({}) matches all
					// namespaces.
					namespaceSelector?: {
						// matchExpressions is a list of label selector requirements. The
						// requirements are ANDed.
						matchExpressions?: [...{
							// key is the label key that the selector applies to.
							key: string

							// operator represents a key's relationship to a set of values.
							// Valid operators are In, NotIn, Exists and DoesNotExist.
							operator: string

							// values is an array of string values. If the operator is In or
							// NotIn, the values array must be non-empty. If the operator is
							// Exists or DoesNotExist, the values array must be empty. This
							// array is replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// matchLabels is a map of {key,value} pairs. A single {key,value}
						// in the matchLabels map is equivalent to an element of
						// matchExpressions, whose key field is "key", the operator is
						// "In", and the values array contains only "value". The
						// requirements are ANDed.
						matchLabels?: {
							[string]: string
						}
						...
					}

					// namespaces specifies a static list of namespace names that the
					// term applies to. The term is applied to the union of the
					// namespaces listed in this field and the ones selected by
					// namespaceSelector. null or empty namespaces list and null
					// namespaceSelector means "this pod's namespace".
					namespaces?: [...string]

					// This pod should be co-located (affinity) or not co-located
					// (anti-affinity) with the pods matching the labelSelector in
					// the specified namespaces, where co-located is defined as
					// running on a node whose value of the label with key
					// topologyKey matches that of any node on which any of the
					// selected pods is running. Empty topologyKey is not allowed.
					topologyKey: string
					...
				}]
				...
			}

			// AdditionalPodAntiAffinity allows to specify pod anti-affinity
			// terms to be added to the ones generated by the operator if
			// EnablePodAntiAffinity is set to true (default) or to be used
			// exclusively if set to false.
			additionalPodAntiAffinity?: {
				// The scheduler will prefer to schedule pods to nodes that
				// satisfy the anti-affinity expressions specified by this field,
				// but it may choose a node that violates one or more of the
				// expressions. The node that is most preferred is the one with
				// the greatest sum of weights, i.e. for each node that meets all
				// of the scheduling requirements (resource request,
				// requiredDuringScheduling anti-affinity expressions, etc.),
				// compute a sum by iterating through the elements of this field
				// and adding "weight" to the sum if the node has pods which
				// matches the corresponding podAffinityTerm; the node(s) with
				// the highest sum are the most preferred.
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					// Required. A pod affinity term, associated with the
					// corresponding weight.
					podAffinityTerm: {
						// A label query over a set of resources, in this case pods.
						labelSelector?: {
							// matchExpressions is a list of label selector requirements. The
							// requirements are ANDed.
							matchExpressions?: [...{
								// key is the label key that the selector applies to.
								key: string

								// operator represents a key's relationship to a set of values.
								// Valid operators are In, NotIn, Exists and DoesNotExist.
								operator: string

								// values is an array of string values. If the operator is In or
								// NotIn, the values array must be non-empty. If the operator is
								// Exists or DoesNotExist, the values array must be empty. This
								// array is replaced during a strategic merge patch.
								values?: [...string]
								...
							}]

							// matchLabels is a map of {key,value} pairs. A single {key,value}
							// in the matchLabels map is equivalent to an element of
							// matchExpressions, whose key field is "key", the operator is
							// "In", and the values array contains only "value". The
							// requirements are ANDed.
							matchLabels?: {
								[string]: string
							}
							...
						}

						// A label query over the set of namespaces that the term applies
						// to. The term is applied to the union of the namespaces
						// selected by this field and the ones listed in the namespaces
						// field. null selector and null or empty namespaces list means
						// "this pod's namespace". An empty selector ({}) matches all
						// namespaces.
						namespaceSelector?: {
							// matchExpressions is a list of label selector requirements. The
							// requirements are ANDed.
							matchExpressions?: [...{
								// key is the label key that the selector applies to.
								key: string

								// operator represents a key's relationship to a set of values.
								// Valid operators are In, NotIn, Exists and DoesNotExist.
								operator: string

								// values is an array of string values. If the operator is In or
								// NotIn, the values array must be non-empty. If the operator is
								// Exists or DoesNotExist, the values array must be empty. This
								// array is replaced during a strategic merge patch.
								values?: [...string]
								...
							}]

							// matchLabels is a map of {key,value} pairs. A single {key,value}
							// in the matchLabels map is equivalent to an element of
							// matchExpressions, whose key field is "key", the operator is
							// "In", and the values array contains only "value". The
							// requirements are ANDed.
							matchLabels?: {
								[string]: string
							}
							...
						}

						// namespaces specifies a static list of namespace names that the
						// term applies to. The term is applied to the union of the
						// namespaces listed in this field and the ones selected by
						// namespaceSelector. null or empty namespaces list and null
						// namespaceSelector means "this pod's namespace".
						namespaces?: [...string]

						// This pod should be co-located (affinity) or not co-located
						// (anti-affinity) with the pods matching the labelSelector in
						// the specified namespaces, where co-located is defined as
						// running on a node whose value of the label with key
						// topologyKey matches that of any node on which any of the
						// selected pods is running. Empty topologyKey is not allowed.
						topologyKey: string
						...
					}

					// weight associated with matching the corresponding
					// podAffinityTerm, in the range 1-100.
					weight: int
					...
				}]

				// If the anti-affinity requirements specified by this field are
				// not met at scheduling time, the pod will not be scheduled onto
				// the node. If the anti-affinity requirements specified by this
				// field cease to be met at some point during pod execution (e.g.
				// due to a pod label update), the system may or may not try to
				// eventually evict the pod from its node. When there are
				// multiple elements, the lists of nodes corresponding to each
				// podAffinityTerm are intersected, i.e. all terms must be
				// satisfied.
				requiredDuringSchedulingIgnoredDuringExecution?: [...{
					// A label query over a set of resources, in this case pods.
					labelSelector?: {
						// matchExpressions is a list of label selector requirements. The
						// requirements are ANDed.
						matchExpressions?: [...{
							// key is the label key that the selector applies to.
							key: string

							// operator represents a key's relationship to a set of values.
							// Valid operators are In, NotIn, Exists and DoesNotExist.
							operator: string

							// values is an array of string values. If the operator is In or
							// NotIn, the values array must be non-empty. If the operator is
							// Exists or DoesNotExist, the values array must be empty. This
							// array is replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// matchLabels is a map of {key,value} pairs. A single {key,value}
						// in the matchLabels map is equivalent to an element of
						// matchExpressions, whose key field is "key", the operator is
						// "In", and the values array contains only "value". The
						// requirements are ANDed.
						matchLabels?: {
							[string]: string
						}
						...
					}

					// A label query over the set of namespaces that the term applies
					// to. The term is applied to the union of the namespaces
					// selected by this field and the ones listed in the namespaces
					// field. null selector and null or empty namespaces list means
					// "this pod's namespace". An empty selector ({}) matches all
					// namespaces.
					namespaceSelector?: {
						// matchExpressions is a list of label selector requirements. The
						// requirements are ANDed.
						matchExpressions?: [...{
							// key is the label key that the selector applies to.
							key: string

							// operator represents a key's relationship to a set of values.
							// Valid operators are In, NotIn, Exists and DoesNotExist.
							operator: string

							// values is an array of string values. If the operator is In or
							// NotIn, the values array must be non-empty. If the operator is
							// Exists or DoesNotExist, the values array must be empty. This
							// array is replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// matchLabels is a map of {key,value} pairs. A single {key,value}
						// in the matchLabels map is equivalent to an element of
						// matchExpressions, whose key field is "key", the operator is
						// "In", and the values array contains only "value". The
						// requirements are ANDed.
						matchLabels?: {
							[string]: string
						}
						...
					}

					// namespaces specifies a static list of namespace names that the
					// term applies to. The term is applied to the union of the
					// namespaces listed in this field and the ones selected by
					// namespaceSelector. null or empty namespaces list and null
					// namespaceSelector means "this pod's namespace".
					namespaces?: [...string]

					// This pod should be co-located (affinity) or not co-located
					// (anti-affinity) with the pods matching the labelSelector in
					// the specified namespaces, where co-located is defined as
					// running on a node whose value of the label with key
					// topologyKey matches that of any node on which any of the
					// selected pods is running. Empty topologyKey is not allowed.
					topologyKey: string
					...
				}]
				...
			}

			// Activates anti-affinity for the pods. The operator will define
			// pods anti-affinity unless this field is explicitly set to
			// false
			enablePodAntiAffinity?: bool

			// NodeAffinity describes node affinity scheduling rules for the
			// pod. More info:
			// https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
			nodeAffinity?: {
				// The scheduler will prefer to schedule pods to nodes that
				// satisfy the affinity expressions specified by this field, but
				// it may choose a node that violates one or more of the
				// expressions. The node that is most preferred is the one with
				// the greatest sum of weights, i.e. for each node that meets all
				// of the scheduling requirements (resource request,
				// requiredDuringScheduling affinity expressions, etc.), compute
				// a sum by iterating through the elements of this field and
				// adding "weight" to the sum if the node matches the
				// corresponding matchExpressions; the node(s) with the highest
				// sum are the most preferred.
				preferredDuringSchedulingIgnoredDuringExecution?: [...{
					// A node selector term, associated with the corresponding weight.
					preference: {
						// A list of node selector requirements by node's labels.
						matchExpressions?: [...{
							// The label key that the selector applies to.
							key: string

							// Represents a key's relationship to a set of values. Valid
							// operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
							operator: string

							// An array of string values. If the operator is In or NotIn, the
							// values array must be non-empty. If the operator is Exists or
							// DoesNotExist, the values array must be empty. If the operator
							// is Gt or Lt, the values array must have a single element,
							// which will be interpreted as an integer. This array is
							// replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// A list of node selector requirements by node's fields.
						matchFields?: [...{
							// The label key that the selector applies to.
							key: string

							// Represents a key's relationship to a set of values. Valid
							// operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
							operator: string

							// An array of string values. If the operator is In or NotIn, the
							// values array must be non-empty. If the operator is Exists or
							// DoesNotExist, the values array must be empty. If the operator
							// is Gt or Lt, the values array must have a single element,
							// which will be interpreted as an integer. This array is
							// replaced during a strategic merge patch.
							values?: [...string]
							...
						}]
						...
					}

					// Weight associated with matching the corresponding
					// nodeSelectorTerm, in the range 1-100.
					weight: int
					...
				}]

				// If the affinity requirements specified by this field are not
				// met at scheduling time, the pod will not be scheduled onto the
				// node. If the affinity requirements specified by this field
				// cease to be met at some point during pod execution (e.g. due
				// to an update), the system may or may not try to eventually
				// evict the pod from its node.
				requiredDuringSchedulingIgnoredDuringExecution?: {
					// Required. A list of node selector terms. The terms are ORed.
					nodeSelectorTerms: [...{
						// A list of node selector requirements by node's labels.
						matchExpressions?: [...{
							// The label key that the selector applies to.
							key: string

							// Represents a key's relationship to a set of values. Valid
							// operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
							operator: string

							// An array of string values. If the operator is In or NotIn, the
							// values array must be non-empty. If the operator is Exists or
							// DoesNotExist, the values array must be empty. If the operator
							// is Gt or Lt, the values array must have a single element,
							// which will be interpreted as an integer. This array is
							// replaced during a strategic merge patch.
							values?: [...string]
							...
						}]

						// A list of node selector requirements by node's fields.
						matchFields?: [...{
							// The label key that the selector applies to.
							key: string

							// Represents a key's relationship to a set of values. Valid
							// operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
							operator: string

							// An array of string values. If the operator is In or NotIn, the
							// values array must be non-empty. If the operator is Exists or
							// DoesNotExist, the values array must be empty. If the operator
							// is Gt or Lt, the values array must have a single element,
							// which will be interpreted as an integer. This array is
							// replaced during a strategic merge patch.
							values?: [...string]
							...
						}]
						...
					}]
					...
				}
				...
			}

			// NodeSelector is map of key-value pairs used to define the nodes
			// on which the pods can run. More info:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
			nodeSelector?: {
				[string]: string
			}

			// PodAntiAffinityType allows the user to decide whether pod
			// anti-affinity between cluster instance has to be considered a
			// strong requirement during scheduling or not. Allowed values
			// are: "preferred" (default if empty) or "required". Setting it
			// to "required", could lead to instances remaining pending until
			// new kubernetes nodes are added if all the existing nodes don't
			// match the required pod anti-affinity rule. More info:
			// https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
			podAntiAffinityType?: string

			// Tolerations is a list of Tolerations that should be set for all
			// the pods, in order to allow them to run on tainted nodes. More
			// info:
			// https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
			tolerations?: [...{
				// Effect indicates the taint effect to match. Empty means match
				// all taint effects. When specified, allowed values are
				// NoSchedule, PreferNoSchedule and NoExecute.
				effect?: string

				// Key is the taint key that the toleration applies to. Empty
				// means match all taint keys. If the key is empty, operator must
				// be Exists; this combination means to match all values and all
				// keys.
				key?: string

				// Operator represents a key's relationship to the value. Valid
				// operators are Exists and Equal. Defaults to Equal. Exists is
				// equivalent to wildcard for value, so that a pod can tolerate
				// all taints of a particular category.
				operator?: string

				// TolerationSeconds represents the period of time the toleration
				// (which must be of effect NoExecute, otherwise this field is
				// ignored) tolerates the taint. By default, it is not set, which
				// means tolerate the taint forever (do not evict). Zero and
				// negative values will be treated as 0 (evict immediately) by
				// the system.
				tolerationSeconds?: int

				// Value is the taint value the toleration matches to. If the
				// operator is Exists, the value should be empty, otherwise just
				// a regular string.
				value?: string
				...
			}]

			// TopologyKey to use for anti-affinity configuration. See k8s
			// documentation for more info on that
			topologyKey?: string
			...
		}

		// The configuration to be used for backups
		backup?: {
			// The configuration for the barman-cloud tool suite
			barmanObjectStore?: {
				// The credentials to use to upload data to Azure Blob Storage
				azureCredentials?: {
					// The connection string to be used
					connectionString?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// Use the Azure AD based authentication without providing
					// explicitly the keys.
					inheritFromAzureAD?: bool

					// The storage account where to upload data
					storageAccount?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The storage account key to be used in conjunction with the
					// storage account name
					storageKey?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// A shared-access-signature to be used in conjunction with the
					// storage account name
					storageSasToken?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}
					...
				}

				// The configuration to be used to backup the data files When not
				// defined, base backups files will be stored uncompressed and
				// may be unencrypted in the object store, according to the
				// bucket default policy.
				data?: {
					// Compress a backup file (a tar file per tablespace) while
					// streaming it to the object store. Available options are empty
					// string (no compression, default), `gzip`, `bzip2` or `snappy`.
					compression?: "gzip" | "bzip2" | "snappy"

					// Whenever to force the encryption of files (if the bucket is not
					// already configured for that). Allowed options are empty string
					// (use the bucket policy, default), `AES256` and `aws:kms`
					encryption?: "AES256" | "aws:kms"

					// Control whether the I/O workload for the backup initial
					// checkpoint will be limited, according to the
					// `checkpoint_completion_target` setting on the PostgreSQL
					// server. If set to true, an immediate checkpoint will be used,
					// meaning PostgreSQL will complete the checkpoint as soon as
					// possible. `false` by default.
					immediateCheckpoint?: bool

					// The number of parallel jobs to be used to upload the backup,
					// defaults to 2
					jobs?: int & >=1
					...
				}

				// The path where to store the backup (i.e.
				// s3://bucket/path/to/folder) this path, with different
				// destination folders, will be used for WALs and for data
				destinationPath: strings.MinRunes(1)

				// EndpointCA store the CA bundle of the barman endpoint. Useful
				// when using self-signed certificates to avoid errors with
				// certificate issuer and barman-cloud-wal-archive
				endpointCA?: {
					// The key to select
					key: string

					// Name of the referent.
					name: string
					...
				}

				// Endpoint to be used to upload data to the cloud, overriding the
				// automatic endpoint discovery
				endpointURL?: string

				// The credentials to use to upload data to Google Cloud Storage
				googleCredentials?: {
					// The secret containing the Google Cloud Storage JSON file with
					// the credentials
					applicationCredentials?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// If set to true, will presume that it's running inside a GKE
					// environment, default to false.
					gkeEnvironment?: bool
					...
				}

				// HistoryTags is a list of key value pairs that will be passed to
				// the Barman --history-tags option.
				historyTags?: {
					[string]: string
				}

				// The credentials to use to upload data to S3
				s3Credentials?: {
					// The reference to the access key id
					accessKeyId?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// Use the role based authentication without providing explicitly
					// the keys.
					inheritFromIAMRole?: bool

					// The reference to the secret containing the region name
					region?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The reference to the secret access key
					secretAccessKey?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The references to the session key
					sessionToken?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}
					...
				}

				// The server name on S3, the cluster name is used if this
				// parameter is omitted
				serverName?: string

				// Tags is a list of key value pairs that will be passed to the
				// Barman --tags option.
				tags?: {
					[string]: string
				}

				// The configuration for the backup of the WAL stream. When not
				// defined, WAL files will be stored uncompressed and may be
				// unencrypted in the object store, according to the bucket
				// default policy.
				wal?: {
					// Compress a WAL file before sending it to the object store.
					// Available options are empty string (no compression, default),
					// `gzip`, `bzip2` or `snappy`.
					compression?: "gzip" | "bzip2" | "snappy"

					// Whenever to force the encryption of files (if the bucket is not
					// already configured for that). Allowed options are empty string
					// (use the bucket policy, default), `AES256` and `aws:kms`
					encryption?: "AES256" | "aws:kms"

					// Number of WAL files to be either archived in parallel (when the
					// PostgreSQL instance is archiving to a backup object store) or
					// restored in parallel (when a PostgreSQL standby is fetching
					// WAL files from a recovery object store). If not specified, WAL
					// files will be processed one at a time. It accepts a positive
					// integer as a value - with 1 being the minimum accepted value.
					maxParallel?: int & >=1
					...
				}
				...
			}

			// RetentionPolicy is the retention policy to be used for backups
			// and WALs (i.e. '60d'). The retention policy is expressed in
			// the form of `XXu` where `XX` is a positive integer and `u` is
			// in `[dwm]` - days, weeks, months. It's currently only
			// applicable when using the BarmanObjectStore method.
			retentionPolicy?: =~"^[1-9][0-9]*[dwm]$"

			// The policy to decide which instance should perform backups.
			// Available options are empty string, which will default to
			// `prefer-standby` policy, `primary` to have backups run always
			// on primary instances, `prefer-standby` to have backups run
			// preferably on the most updated standby, if available.
			target?: "primary" | "prefer-standby" | *"prefer-standby"

			// VolumeSnapshot provides the configuration for the execution of
			// volume snapshot backups.
			volumeSnapshot?: {
				// Annotations key-value pairs that will be added to
				// .metadata.annotations snapshot resources.
				annotations?: {
					[string]: string
				}

				// ClassName specifies the Snapshot Class to be used for PG_DATA
				// PersistentVolumeClaim. It is the default class for the other
				// types if no specific class is present
				className?: string

				// Labels are key-value pairs that will be added to
				// .metadata.labels snapshot resources.
				labels?: {
					[string]: string
				}

				// Whether the default type of backup with volume snapshots is
				// online/hot (`true`, default) or offline/cold (`false`)
				online?: bool | *true

				// Configuration parameters to control the online/hot backup with
				// volume snapshots
				onlineConfiguration?: {
					// Control whether the I/O workload for the backup initial
					// checkpoint will be limited, according to the
					// `checkpoint_completion_target` setting on the PostgreSQL
					// server. If set to true, an immediate checkpoint will be used,
					// meaning PostgreSQL will complete the checkpoint as soon as
					// possible. `false` by default.
					immediateCheckpoint?: bool

					// If false, the function will return immediately after the backup
					// is completed, without waiting for WAL to be archived. This
					// behavior is only useful with backup software that
					// independently monitors WAL archiving. Otherwise, WAL required
					// to make the backup consistent might be missing and make the
					// backup useless. By default, or when this parameter is true,
					// pg_backup_stop will wait for WAL to be archived when archiving
					// is enabled. On a standby, this means that it will wait only
					// when archive_mode = always. If write activity on the primary
					// is low, it may be useful to run pg_switch_wal on the primary
					// in order to trigger an immediate segment switch.
					waitForArchive?: bool | *true
					...
				} | *{
					immediateCheckpoint: false
					waitForArchive:      true
					...
				}

				// SnapshotOwnerReference indicates the type of owner reference
				// the snapshot should have
				snapshotOwnerReference?: "none" | "cluster" | "backup" | *"none"

				// WalClassName specifies the Snapshot Class to be used for the
				// PG_WAL PersistentVolumeClaim.
				walClassName?: string
				...
			}
			...
		}

		// Instructions to bootstrap this cluster
		bootstrap?: {
			// Bootstrap the cluster via initdb
			initdb?: {
				// Whether the `-k` option should be passed to initdb, enabling
				// checksums on data pages (default: `false`)
				dataChecksums?: bool

				// Name of the database used by the application. Default: `app`.
				database?: string

				// The value to be passed as option `--encoding` for initdb
				// (default:`UTF8`)
				encoding?: string

				// Bootstraps the new cluster by importing data from an existing
				// PostgreSQL instance using logical backup (`pg_dump` and
				// `pg_restore`)
				import?: {
					// The databases to import
					databases: [...string]

					// List of SQL queries to be executed as a superuser in the
					// application database right after is imported - to be used with
					// extreme care (by default empty). Only available in
					// microservice type.
					postImportApplicationSQL?: [...string]

					// The roles to import
					roles?: [...string]

					// When set to true, only the `pre-data` and `post-data` sections
					// of `pg_restore` are invoked, avoiding data import. Default:
					// `false`.
					schemaOnly?: bool

					// The source of the import
					source: {
						// The name of the externalCluster used for import
						externalCluster: string
						...
					}

					// The import type. Can be `microservice` or `monolith`.
					type: "microservice" | "monolith"
					...
				}

				// The value to be passed as option `--lc-ctype` for initdb
				// (default:`C`)
				localeCType?: string

				// The value to be passed as option `--lc-collate` for initdb
				// (default:`C`)
				localeCollate?: string

				// The list of options that must be passed to initdb when creating
				// the cluster. Deprecated: This could lead to inconsistent
				// configurations, please use the explicit provided parameters
				// instead. If defined, explicit values will be ignored.
				options?: [...string]

				// Name of the owner of the database in the instance to be used by
				// applications. Defaults to the value of the `database` key.
				owner?: string

				// List of SQL queries to be executed as a superuser in the
				// application database right after is created - to be used with
				// extreme care (by default empty)
				postInitApplicationSQL?: [...string]

				// PostInitApplicationSQLRefs points references to ConfigMaps or
				// Secrets which contain SQL files, the general implementation
				// order to these references is from all Secrets to all
				// ConfigMaps, and inside Secrets or ConfigMaps, the
				// implementation order is same as the order of each array (by
				// default empty)
				postInitApplicationSQLRefs?: {
					// ConfigMapRefs holds a list of references to ConfigMaps
					configMapRefs?: [...{
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}]

					// SecretRefs holds a list of references to Secrets
					secretRefs?: [...{
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}]
					...
				}

				// List of SQL queries to be executed as a superuser immediately
				// after the cluster has been created - to be used with extreme
				// care (by default empty)
				postInitSQL?: [...string]

				// List of SQL queries to be executed as a superuser in the
				// `template1` after the cluster has been created - to be used
				// with extreme care (by default empty)
				postInitTemplateSQL?: [...string]

				// Name of the secret containing the initial credentials for the
				// owner of the user database. If empty a new secret will be
				// created from scratch
				secret?: {
					// Name of the referent.
					name: string
					...
				}

				// The value in megabytes (1 to 1024) to be passed to the
				// `--wal-segsize` option for initdb (default: empty, resulting
				// in PostgreSQL default: 16MB)
				walSegmentSize?: int & <=1024 & >=1
				...
			}

			// Bootstrap the cluster taking a physical backup of another
			// compatible PostgreSQL instance
			pg_basebackup?: {
				// Name of the database used by the application. Default: `app`.
				database?: string

				// Name of the owner of the database in the instance to be used by
				// applications. Defaults to the value of the `database` key.
				owner?: string

				// Name of the secret containing the initial credentials for the
				// owner of the user database. If empty a new secret will be
				// created from scratch
				secret?: {
					// Name of the referent.
					name: string
					...
				}

				// The name of the server of which we need to take a physical
				// backup
				source: strings.MinRunes(1)
				...
			}

			// Bootstrap the cluster from a backup
			recovery?: {
				// The backup object containing the physical base backup from
				// which to initiate the recovery procedure. Mutually exclusive
				// with `source` and `volumeSnapshots`.
				backup?: {
					// EndpointCA store the CA bundle of the barman endpoint. Useful
					// when using self-signed certificates to avoid errors with
					// certificate issuer and barman-cloud-wal-archive.
					endpointCA?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// Name of the referent.
					name: string
					...
				}

				// Name of the database used by the application. Default: `app`.
				database?: string

				// Name of the owner of the database in the instance to be used by
				// applications. Defaults to the value of the `database` key.
				owner?: string

				// By default, the recovery process applies all the available WAL
				// files in the archive (full recovery). However, you can also
				// end the recovery as soon as a consistent state is reached or
				// recover to a point-in-time (PITR) by specifying a
				// `RecoveryTarget` object, as expected by PostgreSQL (i.e.,
				// timestamp, transaction Id, LSN, ...). More info:
				// https://www.postgresql.org/docs/current/runtime-config-wal.html#RUNTIME-CONFIG-WAL-RECOVERY-TARGET
				recoveryTarget?: {
					// The ID of the backup from which to start the recovery process.
					// If empty (default) the operator will automatically detect the
					// backup based on targetTime or targetLSN if specified.
					// Otherwise use the latest available backup in chronological
					// order.
					backupID?: string

					// Set the target to be exclusive. If omitted, defaults to false,
					// so that in Postgres, `recovery_target_inclusive` will be true
					exclusive?: bool

					// End recovery as soon as a consistent state is reached
					targetImmediate?: bool

					// The target LSN (Log Sequence Number)
					targetLSN?: string

					// The target name (to be previously created with
					// `pg_create_restore_point`)
					targetName?: string

					// The target timeline ("latest" or a positive integer)
					targetTLI?: string

					// The target time as a timestamp in the RFC3339 standard
					targetTime?: string

					// The target transaction ID
					targetXID?: string
					...
				}

				// Name of the secret containing the initial credentials for the
				// owner of the user database. If empty a new secret will be
				// created from scratch
				secret?: {
					// Name of the referent.
					name: string
					...
				}

				// The external cluster whose backup we will restore. This is also
				// used as the name of the folder under which the backup is
				// stored, so it must be set to the name of the source cluster
				// Mutually exclusive with `backup`.
				source?: string

				// The static PVC data source(s) from which to initiate the
				// recovery procedure. Currently supporting `VolumeSnapshot` and
				// `PersistentVolumeClaim` resources that map an existing PVC
				// group, compatible with CloudNativePG, and taken with a cold
				// backup copy on a fenced Postgres instance (limitation which
				// will be removed in the future when online backup will be
				// implemented). Mutually exclusive with `backup`.
				volumeSnapshots?: {
					// Configuration of the storage of the instances
					storage: {
						// APIGroup is the group for the resource being referenced. If
						// APIGroup is not specified, the specified Kind must be in the
						// core API group. For any other third-party types, APIGroup is
						// required.
						apiGroup?: string

						// Kind is the type of resource being referenced
						kind: string

						// Name is the name of resource being referenced
						name: string
						...
					}

					// Configuration of the storage for PostgreSQL WAL (Write-Ahead
					// Log)
					walStorage?: {
						// APIGroup is the group for the resource being referenced. If
						// APIGroup is not specified, the specified Kind must be in the
						// core API group. For any other third-party types, APIGroup is
						// required.
						apiGroup?: string

						// Kind is the type of resource being referenced
						kind: string

						// Name is the name of resource being referenced
						name: string
						...
					}
					...
				}
				...
			}
			...
		}

		// The configuration for the CA and related certificates
		certificates?: {
			// The secret containing the Client CA certificate. If not
			// defined, a new secret will be created with a self-signed CA
			// and will be used to generate all the client certificates.<br
			// /> <br /> Contains:<br /> <br /> - `ca.crt`: CA that should be
			// used to validate the client certificates, used as
			// `ssl_ca_file` of all the instances.<br /> - `ca.key`: key used
			// to generate client certificates, if ReplicationTLSSecret is
			// provided, this can be omitted.<br />
			clientCASecret?: string

			// The secret of type kubernetes.io/tls containing the client
			// certificate to authenticate as the `streaming_replica` user.
			// If not defined, ClientCASecret must provide also `ca.key`, and
			// a new secret will be created using the provided CA.
			replicationTLSSecret?: string

			// The list of the server alternative DNS names to be added to the
			// generated server TLS certificates, when required.
			serverAltDNSNames?: [...string]

			// The secret containing the Server CA certificate. If not
			// defined, a new secret will be created with a self-signed CA
			// and will be used to generate the TLS certificate
			// ServerTLSSecret.<br /> <br /> Contains:<br /> <br /> -
			// `ca.crt`: CA that should be used to validate the server
			// certificate, used as `sslrootcert` in client connection
			// strings.<br /> - `ca.key`: key used to generate Server SSL
			// certs, if ServerTLSSecret is provided, this can be omitted.<br
			// />
			serverCASecret?: string

			// The secret of type kubernetes.io/tls containing the server TLS
			// certificate and key that will be set as `ssl_cert_file` and
			// `ssl_key_file` so that clients can connect to postgres
			// securely. If not defined, ServerCASecret must provide also
			// `ca.key` and a new secret will be created using the provided
			// CA.
			serverTLSSecret?: string
			...
		}

		// Description of this PostgreSQL cluster
		description?: string

		// When this option is enabled, the operator will use the
		// `SuperuserSecret` to update the `postgres` user password (if
		// the secret is not present, the operator will automatically
		// create one). When this option is disabled, the operator will
		// ignore the `SuperuserSecret` content, delete it when
		// automatically created, and then blank the password of the
		// `postgres` user by setting it to `NULL`. Disabled by default.
		enableSuperuserAccess?: bool | *false

		// Env follows the Env format to pass environment variables to the
		// pods created in the cluster
		env?: [...{
			// Name of the environment variable. Must be a C_IDENTIFIER.
			name: string

			// Variable references $(VAR_NAME) are expanded using the
			// previously defined environment variables in the container and
			// any service environment variables. If a variable cannot be
			// resolved, the reference in the input string will be unchanged.
			// Double $$ are reduced to a single $, which allows for escaping
			// the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the
			// string literal "$(VAR_NAME)". Escaped references will never be
			// expanded, regardless of whether the variable exists or not.
			// Defaults to "".
			value?: string

			// Source for the environment variable's value. Cannot be used if
			// value is not empty.
			valueFrom?: {
				// Selects a key of a ConfigMap.
				configMapKeyRef?: {
					// The key to select.
					key: string

					// Name of the referent. More info:
					// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
					// TODO: Add other useful fields. apiVersion, kind, uid?
					name?: string

					// Specify whether the ConfigMap or its key must be defined
					optional?: bool
					...
				}

				// Selects a field of the pod: supports metadata.name,
				// metadata.namespace, `metadata.labels['<KEY>']`,
				// `metadata.annotations['<KEY>']`, spec.nodeName,
				// spec.serviceAccountName, status.hostIP, status.podIP,
				// status.podIPs.
				fieldRef?: {
					// Version of the schema the FieldPath is written in terms of,
					// defaults to "v1".
					apiVersion?: string

					// Path of the field to select in the specified API version.
					fieldPath: string
					...
				}

				// Selects a resource of the container: only resources limits and
				// requests (limits.cpu, limits.memory, limits.ephemeral-storage,
				// requests.cpu, requests.memory and requests.ephemeral-storage)
				// are currently supported.
				resourceFieldRef?: {
					// Container name: required for volumes, optional for env vars
					containerName?: string

					// Specifies the output format of the exposed resources, defaults
					// to "1"
					divisor?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"

					// Required: resource to select
					resource: string
					...
				}

				// Selects a key of a secret in the pod's namespace
				secretKeyRef?: {
					// The key of the secret to select from. Must be a valid secret
					// key.
					key: string

					// Name of the referent. More info:
					// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
					// TODO: Add other useful fields. apiVersion, kind, uid?
					name?: string

					// Specify whether the Secret or its key must be defined
					optional?: bool
					...
				}
				...
			}
			...
		}]

		// EnvFrom follows the EnvFrom format to pass environment
		// variables sources to the pods to be used by Env
		envFrom?: [...{
			// The ConfigMap to select from
			configMapRef?: {
				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the ConfigMap must be defined
				optional?: bool
				...
			}

			// An optional identifier to prepend to each key in the ConfigMap.
			// Must be a C_IDENTIFIER.
			prefix?: string

			// The Secret to select from
			secretRef?: {
				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the Secret must be defined
				optional?: bool
				...
			}
			...
		}]

		// EphemeralVolumesSizeLimit allows the user to set the limits for
		// the ephemeral volumes
		ephemeralVolumesSizeLimit?: {
			// Shm is the size limit of the shared memory volume
			shm?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"

			// TemporaryData is the size limit of the temporary data volume
			temporaryData?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
			...
		}

		// The list of external clusters which are used in the
		// configuration
		externalClusters?: [...{
			// The configuration for the barman-cloud tool suite
			barmanObjectStore?: {
				// The credentials to use to upload data to Azure Blob Storage
				azureCredentials?: {
					// The connection string to be used
					connectionString?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// Use the Azure AD based authentication without providing
					// explicitly the keys.
					inheritFromAzureAD?: bool

					// The storage account where to upload data
					storageAccount?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The storage account key to be used in conjunction with the
					// storage account name
					storageKey?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// A shared-access-signature to be used in conjunction with the
					// storage account name
					storageSasToken?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}
					...
				}

				// The configuration to be used to backup the data files When not
				// defined, base backups files will be stored uncompressed and
				// may be unencrypted in the object store, according to the
				// bucket default policy.
				data?: {
					// Compress a backup file (a tar file per tablespace) while
					// streaming it to the object store. Available options are empty
					// string (no compression, default), `gzip`, `bzip2` or `snappy`.
					compression?: "gzip" | "bzip2" | "snappy"

					// Whenever to force the encryption of files (if the bucket is not
					// already configured for that). Allowed options are empty string
					// (use the bucket policy, default), `AES256` and `aws:kms`
					encryption?: "AES256" | "aws:kms"

					// Control whether the I/O workload for the backup initial
					// checkpoint will be limited, according to the
					// `checkpoint_completion_target` setting on the PostgreSQL
					// server. If set to true, an immediate checkpoint will be used,
					// meaning PostgreSQL will complete the checkpoint as soon as
					// possible. `false` by default.
					immediateCheckpoint?: bool

					// The number of parallel jobs to be used to upload the backup,
					// defaults to 2
					jobs?: int & >=1
					...
				}

				// The path where to store the backup (i.e.
				// s3://bucket/path/to/folder) this path, with different
				// destination folders, will be used for WALs and for data
				destinationPath: strings.MinRunes(1)

				// EndpointCA store the CA bundle of the barman endpoint. Useful
				// when using self-signed certificates to avoid errors with
				// certificate issuer and barman-cloud-wal-archive
				endpointCA?: {
					// The key to select
					key: string

					// Name of the referent.
					name: string
					...
				}

				// Endpoint to be used to upload data to the cloud, overriding the
				// automatic endpoint discovery
				endpointURL?: string

				// The credentials to use to upload data to Google Cloud Storage
				googleCredentials?: {
					// The secret containing the Google Cloud Storage JSON file with
					// the credentials
					applicationCredentials?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// If set to true, will presume that it's running inside a GKE
					// environment, default to false.
					gkeEnvironment?: bool
					...
				}

				// HistoryTags is a list of key value pairs that will be passed to
				// the Barman --history-tags option.
				historyTags?: {
					[string]: string
				}

				// The credentials to use to upload data to S3
				s3Credentials?: {
					// The reference to the access key id
					accessKeyId?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// Use the role based authentication without providing explicitly
					// the keys.
					inheritFromIAMRole?: bool

					// The reference to the secret containing the region name
					region?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The reference to the secret access key
					secretAccessKey?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}

					// The references to the session key
					sessionToken?: {
						// The key to select
						key: string

						// Name of the referent.
						name: string
						...
					}
					...
				}

				// The server name on S3, the cluster name is used if this
				// parameter is omitted
				serverName?: string

				// Tags is a list of key value pairs that will be passed to the
				// Barman --tags option.
				tags?: {
					[string]: string
				}

				// The configuration for the backup of the WAL stream. When not
				// defined, WAL files will be stored uncompressed and may be
				// unencrypted in the object store, according to the bucket
				// default policy.
				wal?: {
					// Compress a WAL file before sending it to the object store.
					// Available options are empty string (no compression, default),
					// `gzip`, `bzip2` or `snappy`.
					compression?: "gzip" | "bzip2" | "snappy"

					// Whenever to force the encryption of files (if the bucket is not
					// already configured for that). Allowed options are empty string
					// (use the bucket policy, default), `AES256` and `aws:kms`
					encryption?: "AES256" | "aws:kms"

					// Number of WAL files to be either archived in parallel (when the
					// PostgreSQL instance is archiving to a backup object store) or
					// restored in parallel (when a PostgreSQL standby is fetching
					// WAL files from a recovery object store). If not specified, WAL
					// files will be processed one at a time. It accepts a positive
					// integer as a value - with 1 being the minimum accepted value.
					maxParallel?: int & >=1
					...
				}
				...
			}

			// The list of connection parameters, such as dbname, host,
			// username, etc
			connectionParameters?: {
				[string]: string
			}

			// The server name, required
			name: string

			// The reference to the password to be used to connect to the
			// server
			password?: {
				// The key of the secret to select from. Must be a valid secret
				// key.
				key: string

				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the Secret or its key must be defined
				optional?: bool
				...
			}

			// The reference to an SSL certificate to be used to connect to
			// this instance
			sslCert?: {
				// The key of the secret to select from. Must be a valid secret
				// key.
				key: string

				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the Secret or its key must be defined
				optional?: bool
				...
			}

			// The reference to an SSL private key to be used to connect to
			// this instance
			sslKey?: {
				// The key of the secret to select from. Must be a valid secret
				// key.
				key: string

				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the Secret or its key must be defined
				optional?: bool
				...
			}

			// The reference to an SSL CA public key to be used to connect to
			// this instance
			sslRootCert?: {
				// The key of the secret to select from. Must be a valid secret
				// key.
				key: string

				// Name of the referent. More info:
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
				// TODO: Add other useful fields. apiVersion, kind, uid?
				name?: string

				// Specify whether the Secret or its key must be defined
				optional?: bool
				...
			}
			...
		}]

		// The amount of time (in seconds) to wait before triggering a
		// failover after the primary PostgreSQL instance in the cluster
		// was detected to be unhealthy
		failoverDelay?: int | *0

		// Name of the container image, supporting both tags
		// (`<image>:<tag>`) and digests for deterministic and repeatable
		// deployments (`<image>:<tag>@sha256:<digestValue>`)
		imageName?: string

		// Image pull policy. One of `Always`, `Never` or `IfNotPresent`.
		// If not defined, it defaults to `IfNotPresent`. Cannot be
		// updated. More info:
		// https://kubernetes.io/docs/concepts/containers/images#updating-images
		imagePullPolicy?: string

		// The list of pull secrets to be used to pull the images
		imagePullSecrets?: [...{
			// Name of the referent.
			name: string
			...
		}]

		// Metadata that will be inherited by all objects related to the
		// Cluster
		inheritedMetadata?: {
			annotations?: [string]: string
			labels?: [string]:      string
			...
		}

		// Number of instances required in the cluster
		instances: int & >=1 | *1

		// The instances' log level, one of the following values: error,
		// warning, info (default), debug, trace
		logLevel?: "error" | "warning" | "info" | "debug" | "trace" | *"info"

		// The configuration that is used by the portions of PostgreSQL
		// that are managed by the instance manager
		managed?: {
			// Database roles managed by the `Cluster`
			roles?: [...{
				// Whether a role bypasses every row-level security (RLS) policy.
				// Default is `false`.
				bypassrls?: bool

				// Description of the role
				comment?: string

				// If the role can log in, this specifies how many concurrent
				// connections the role can make. `-1` (the default) means no
				// limit.
				connectionLimit?: int | *-1

				// When set to `true`, the role being defined will be allowed to
				// create new databases. Specifying `false` (default) will deny a
				// role the ability to create databases.
				createdb?: bool

				// Whether the role will be permitted to create, alter, drop,
				// comment on, change the security label for, and grant or revoke
				// membership in other roles. Default is `false`.
				createrole?: bool

				// DisablePassword indicates that a role's password should be set
				// to NULL in Postgres
				disablePassword?: bool

				// Ensure the role is `present` or `absent` - defaults to
				// "present"
				ensure?: "present" | "absent" | *"present"

				// List of one or more existing roles to which this role will be
				// immediately added as a new member. Default empty.
				inRoles?: [...string]

				// Whether a role "inherits" the privileges of roles it is a
				// member of. Defaults is `true`.
				inherit?: bool | *true

				// Whether the role is allowed to log in. A role having the
				// `login` attribute can be thought of as a user. Roles without
				// this attribute are useful for managing database privileges,
				// but are not users in the usual sense of the word. Default is
				// `false`.
				login?: bool

				// Name of the role
				name: string

				// Secret containing the password of the role (if present) If
				// null, the password will be ignored unless DisablePassword is
				// set
				passwordSecret?: {
					// Name of the referent.
					name: string
					...
				}

				// Whether a role is a replication role. A role must have this
				// attribute (or be a superuser) in order to be able to connect
				// to the server in replication mode (physical or logical
				// replication) and in order to be able to create or drop
				// replication slots. A role having the `replication` attribute
				// is a very highly privileged role, and should only be used on
				// roles actually used for replication. Default is `false`.
				replication?: bool

				// Whether the role is a `superuser` who can override all access
				// restrictions within the database - superuser status is
				// dangerous and should be used only when really needed. You must
				// yourself be a superuser to create a new superuser. Defaults is
				// `false`.
				superuser?: bool

				// Date and time after which the role's password is no longer
				// valid. When omitted, the password will never expire (default).
				validUntil?: string
				...
			}]
			...
		}

		// The target value for the synchronous replication quorum, that
		// can be decreased if the number of ready standbys is lower than
		// this. Undefined or 0 disable synchronous replication.
		maxSyncReplicas?: int & >=0 | *0

		// Minimum number of instances required in synchronous replication
		// with the primary. Undefined or 0 allow writes to complete when
		// no standby is available.
		minSyncReplicas?: int & >=0 | *0

		// The configuration of the monitoring infrastructure of this
		// cluster
		monitoring?: {
			// The list of config maps containing the custom queries
			customQueriesConfigMap?: [...{
				// The key to select
				key: string

				// Name of the referent.
				name: string
				...
			}]

			// The list of secrets containing the custom queries
			customQueriesSecret?: [...{
				// The key to select
				key: string

				// Name of the referent.
				name: string
				...
			}]

			// Whether the default queries should be injected. Set it to
			// `true` if you don't want to inject default queries into the
			// cluster. Default: false.
			disableDefaultQueries?: bool | *false

			// Enable or disable the `PodMonitor`
			enablePodMonitor?: bool | *false
			...
		}

		// Define a maintenance window for the Kubernetes nodes
		nodeMaintenanceWindow?: {
			// Is there a node maintenance activity in progress?
			inProgress?: bool | *false

			// Reuse the existing PVC (wait for the node to come up again) or
			// not (recreate it elsewhere - when `instances` >1)
			reusePVC?: bool | *true
			...
		}

		// The GID of the `postgres` user inside the image, defaults to
		// `26`
		postgresGID?: int | *26

		// The UID of the `postgres` user inside the image, defaults to
		// `26`
		postgresUID?: int | *26

		// Configuration of the PostgreSQL server
		postgresql?: {
			// Options to specify LDAP configuration
			ldap?: {
				// Bind as authentication configuration
				bindAsAuth?: {
					// Prefix for the bind authentication option
					prefix?: string

					// Suffix for the bind authentication option
					suffix?: string
					...
				}

				// Bind+Search authentication configuration
				bindSearchAuth?: {
					// Root DN to begin the user search
					baseDN?: string

					// DN of the user to bind to the directory
					bindDN?: string

					// Secret with the password for the user to bind to the directory
					bindPassword?: {
						// The key of the secret to select from. Must be a valid secret
						// key.
						key: string

						// Name of the referent. More info:
						// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
						// TODO: Add other useful fields. apiVersion, kind, uid?
						name?: string

						// Specify whether the Secret or its key must be defined
						optional?: bool
						...
					}

					// Attribute to match against the username
					searchAttribute?: string

					// Search filter to use when doing the search+bind authentication
					searchFilter?: string
					...
				}

				// LDAP server port
				port?: int

				// LDAP schema to be used, possible options are `ldap` and `ldaps`
				scheme?: "ldap" | "ldaps"

				// LDAP hostname or IP address
				server?: string

				// Set to 'true' to enable LDAP over TLS. 'false' is default
				tls?: bool
				...
			}

			// PostgreSQL configuration options (postgresql.conf)
			parameters?: {
				[string]: string
			}

			// PostgreSQL Host Based Authentication rules (lines to be
			// appended to the pg_hba.conf file)
			pg_hba?: [...string]

			// Specifies the maximum number of seconds to wait when promoting
			// an instance to primary. Default value is 40000000, greater
			// than one year in seconds, big enough to simulate an infinite
			// timeout
			promotionTimeout?: int

			// Lists of shared preload libraries to add to the default ones
			shared_preload_libraries?: [...string]

			// Requirements to be met by sync replicas. This will affect how
			// the "synchronous_standby_names" parameter will be set up.
			syncReplicaElectionConstraint?: {
				// This flag enables the constraints for sync replicas
				enabled: bool

				// A list of node labels values to extract and compare to evaluate
				// if the pods reside in the same topology or not
				nodeLabelsAntiAffinity?: [...string]
				...
			}
			...
		}

		// Method to follow to upgrade the primary server during a rolling
		// update procedure, after all replicas have been successfully
		// updated: it can be with a switchover (`switchover`) or
		// in-place (`restart` - default)
		primaryUpdateMethod?: "switchover" | "restart" | *"restart"

		// Deployment strategy to follow to upgrade the primary server
		// during a rolling update procedure, after all replicas have
		// been successfully updated: it can be automated (`unsupervised`
		// - default) or manual (`supervised`)
		primaryUpdateStrategy?: "unsupervised" | "supervised" | *"unsupervised"

		// Name of the priority class which will be used in every
		// generated Pod, if the PriorityClass specified does not exist,
		// the pod will not be able to schedule. Please refer to
		// https://kubernetes.io/docs/concepts/scheduling-eviction/pod-priority-preemption/#priorityclass
		// for more information
		priorityClassName?: string

		// Template to be used to define projected volumes, projected
		// volumes will be mounted under `/projected` base folder
		projectedVolumeTemplate?: {
			// defaultMode are the mode bits used to set permissions on
			// created files by default. Must be an octal value between 0000
			// and 0777 or a decimal value between 0 and 511. YAML accepts
			// both octal and decimal values, JSON requires decimal values
			// for mode bits. Directories within the path are not affected by
			// this setting. This might be in conflict with other options
			// that affect the file mode, like fsGroup, and the result can be
			// other mode bits set.
			defaultMode?: int

			// sources is the list of volume projections
			sources?: [...{
				// configMap information about the configMap data to project
				configMap?: {
					// items if unspecified, each key-value pair in the Data field of
					// the referenced ConfigMap will be projected into the volume as
					// a file whose name is the key and content is the value. If
					// specified, the listed keys will be projected into the
					// specified paths, and unlisted keys will not be present. If a
					// key is specified which is not present in the ConfigMap, the
					// volume setup will error unless it is marked optional. Paths
					// must be relative and may not contain the '..' path or start
					// with '..'.
					items?: [...{
						// key is the key to project.
						key: string

						// mode is Optional: mode bits used to set permissions on this
						// file. Must be an octal value between 0000 and 0777 or a
						// decimal value between 0 and 511. YAML accepts both octal and
						// decimal values, JSON requires decimal values for mode bits. If
						// not specified, the volume defaultMode will be used. This might
						// be in conflict with other options that affect the file mode,
						// like fsGroup, and the result can be other mode bits set.
						mode?: int

						// path is the relative path of the file to map the key to. May
						// not be an absolute path. May not contain the path element
						// '..'. May not start with the string '..'.
						path: string
						...
					}]

					// Name of the referent. More info:
					// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
					// TODO: Add other useful fields. apiVersion, kind, uid?
					name?: string

					// optional specify whether the ConfigMap or its keys must be
					// defined
					optional?: bool
					...
				}

				// downwardAPI information about the downwardAPI data to project
				downwardAPI?: {
					// Items is a list of DownwardAPIVolume file
					items?: [...{
						// Required: Selects a field of the pod: only annotations, labels,
						// name and namespace are supported.
						fieldRef?: {
							// Version of the schema the FieldPath is written in terms of,
							// defaults to "v1".
							apiVersion?: string

							// Path of the field to select in the specified API version.
							fieldPath: string
							...
						}

						// Optional: mode bits used to set permissions on this file, must
						// be an octal value between 0000 and 0777 or a decimal value
						// between 0 and 511. YAML accepts both octal and decimal values,
						// JSON requires decimal values for mode bits. If not specified,
						// the volume defaultMode will be used. This might be in conflict
						// with other options that affect the file mode, like fsGroup,
						// and the result can be other mode bits set.
						mode?: int

						// Required: Path is the relative path name of the file to be
						// created. Must not be absolute or contain the '..' path. Must
						// be utf-8 encoded. The first item of the relative path must not
						// start with '..'
						path: string

						// Selects a resource of the container: only resources limits and
						// requests (limits.cpu, limits.memory, requests.cpu and
						// requests.memory) are currently supported.
						resourceFieldRef?: {
							// Container name: required for volumes, optional for env vars
							containerName?: string

							// Specifies the output format of the exposed resources, defaults
							// to "1"
							divisor?: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"

							// Required: resource to select
							resource: string
							...
						}
						...
					}]
					...
				}

				// secret information about the secret data to project
				secret?: {
					// items if unspecified, each key-value pair in the Data field of
					// the referenced Secret will be projected into the volume as a
					// file whose name is the key and content is the value. If
					// specified, the listed keys will be projected into the
					// specified paths, and unlisted keys will not be present. If a
					// key is specified which is not present in the Secret, the
					// volume setup will error unless it is marked optional. Paths
					// must be relative and may not contain the '..' path or start
					// with '..'.
					items?: [...{
						// key is the key to project.
						key: string

						// mode is Optional: mode bits used to set permissions on this
						// file. Must be an octal value between 0000 and 0777 or a
						// decimal value between 0 and 511. YAML accepts both octal and
						// decimal values, JSON requires decimal values for mode bits. If
						// not specified, the volume defaultMode will be used. This might
						// be in conflict with other options that affect the file mode,
						// like fsGroup, and the result can be other mode bits set.
						mode?: int

						// path is the relative path of the file to map the key to. May
						// not be an absolute path. May not contain the path element
						// '..'. May not start with the string '..'.
						path: string
						...
					}]

					// Name of the referent. More info:
					// https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
					// TODO: Add other useful fields. apiVersion, kind, uid?
					name?: string

					// optional field specify whether the Secret or its key must be
					// defined
					optional?: bool
					...
				}

				// serviceAccountToken is information about the
				// serviceAccountToken data to project
				serviceAccountToken?: {
					// audience is the intended audience of the token. A recipient of
					// a token must identify itself with an identifier specified in
					// the audience of the token, and otherwise should reject the
					// token. The audience defaults to the identifier of the
					// apiserver.
					audience?: string

					// expirationSeconds is the requested duration of validity of the
					// service account token. As the token approaches expiration, the
					// kubelet volume plugin will proactively rotate the service
					// account token. The kubelet will start trying to rotate the
					// token if the token is older than 80 percent of its time to
					// live or if the token is older than 24 hours.Defaults to 1 hour
					// and must be at least 10 minutes.
					expirationSeconds?: int

					// path is the path relative to the mount point of the file to
					// project the token into.
					path: string
					...
				}
				...
			}]
			...
		}

		// Replica cluster configuration
		replica?: {
			// If replica mode is enabled, this cluster will be a replica of
			// an existing cluster. Replica cluster can be created from a
			// recovery object store or via streaming through pg_basebackup.
			// Refer to the Replica clusters page of the documentation for
			// more information.
			enabled: bool

			// The name of the external cluster which is the replication
			// origin
			source: strings.MinRunes(1)
			...
		}

		// Replication slots management configuration
		replicationSlots?: {
			// Replication slots for high availability configuration
			highAvailability?: {
				// If enabled (default), the operator will automatically manage
				// replication slots on the primary instance and use them in
				// streaming replication connections with all the standby
				// instances that are part of the HA cluster. If disabled, the
				// operator will not take advantage of replication slots in
				// streaming connections with the replicas. This feature also
				// controls replication slots in replica cluster, from the
				// designated primary to its cascading replicas.
				enabled?: bool | *true

				// Prefix for replication slots managed by the operator for HA. It
				// may only contain lower case letters, numbers, and the
				// underscore character. This can only be set at creation time.
				// By default set to `_cnpg_`.
				slotPrefix?: =~"^[0-9a-z_]*$" | *"_cnpg_"
				...
			} | *{
				enabled: true
				...
			}

			// Standby will update the status of the local replication slots
			// every `updateInterval` seconds (default 30).
			updateInterval?: int & >=1 | *30
			...
		} | *{
			highAvailability: {
				enabled: true
				...
			}
			...
		}

		// Resources requirements of every generated Pod. Please refer to
		// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
		// for more information.
		resources?: {
			// Claims lists the names of resources, defined in
			// spec.resourceClaims, that are used by this container.
			// This is an alpha field and requires enabling the
			// DynamicResourceAllocation feature gate.
			// This field is immutable. It can only be set for containers.
			claims?: [...{
				// Name must match the name of one entry in
				// pod.spec.resourceClaims of the Pod where this field is used.
				// It makes that resource available inside a container.
				name: string
				...
			}]

			// Limits describes the maximum amount of compute resources
			// allowed. More info:
			// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
			limits?: {
				[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
			}

			// Requests describes the minimum amount of compute resources
			// required. If Requests is omitted for a container, it defaults
			// to Limits if that is explicitly specified, otherwise to an
			// implementation-defined value. Requests cannot exceed Limits.
			// More info:
			// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
			requests?: {
				[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
			}
			...
		}

		// If specified, the pod will be dispatched by specified
		// Kubernetes scheduler. If not specified, the pod will be
		// dispatched by the default scheduler. More info:
		// https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/
		schedulerName?: string

		// The SeccompProfile applied to every Pod and Container. Defaults
		// to: `RuntimeDefault`
		seccompProfile?: {
			// localhostProfile indicates a profile defined in a file on the
			// node should be used. The profile must be preconfigured on the
			// node to work. Must be a descending path, relative to the
			// kubelet's configured seccomp profile location. Must be set if
			// type is "Localhost". Must NOT be set for any other type.
			localhostProfile?: string

			// type indicates which kind of seccomp profile will be applied.
			// Valid options are:
			// Localhost - a profile defined in a file on the node should be
			// used. RuntimeDefault - the container runtime default profile
			// should be used. Unconfined - no profile should be applied.
			type: string
			...
		}

		// Configure the generation of the service account
		serviceAccountTemplate?: {
			// Metadata are the metadata to be used for the generated service
			// account
			metadata: {
				// Annotations is an unstructured key value map stored with a
				// resource that may be set by external tools to store and
				// retrieve arbitrary metadata. They are not queryable and should
				// be preserved when modifying objects. More info:
				// http://kubernetes.io/docs/user-guide/annotations
				annotations?: {
					[string]: string
				}

				// Map of string keys and values that can be used to organize and
				// categorize (scope and select) objects. May match selectors of
				// replication controllers and services. More info:
				// http://kubernetes.io/docs/user-guide/labels
				labels?: {
					[string]: string
				}
				...
			}
			...
		}

		// The time in seconds that controls the window of time reserved
		// for the smart shutdown of Postgres to complete. Make sure you
		// reserve enough time for the operator to request a fast
		// shutdown of Postgres (that is: `stopDelay` -
		// `smartShutdownTimeout`).
		smartShutdownTimeout?: int | *180

		// The time in seconds that is allowed for a PostgreSQL instance
		// to successfully start up (default 3600). The startup probe
		// failure threshold is derived from this value using the
		// formula: ceiling(startDelay / 10).
		startDelay?: int | *3600

		// The time in seconds that is allowed for a PostgreSQL instance
		// to gracefully shutdown (default 1800)
		stopDelay?: int | *1800

		// Configuration of the storage of the instances
		storage?: {
			// Template to be used to generate the Persistent Volume Claim
			pvcTemplate?: {
				// accessModes contains the desired access modes the volume should
				// have. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
				accessModes?: [...string]

				// dataSource field can be used to specify either: * An existing
				// VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot)
				// * An existing PVC (PersistentVolumeClaim) If the provisioner
				// or an external controller can support the specified data
				// source, it will create a new volume based on the contents of
				// the specified data source. When the AnyVolumeDataSource
				// feature gate is enabled, dataSource contents will be copied to
				// dataSourceRef, and dataSourceRef contents will be copied to
				// dataSource when dataSourceRef.namespace is not specified. If
				// the namespace is specified, then dataSourceRef will not be
				// copied to dataSource.
				dataSource?: {
					// APIGroup is the group for the resource being referenced. If
					// APIGroup is not specified, the specified Kind must be in the
					// core API group. For any other third-party types, APIGroup is
					// required.
					apiGroup?: string

					// Kind is the type of resource being referenced
					kind: string

					// Name is the name of resource being referenced
					name: string
					...
				}

				// dataSourceRef specifies the object from which to populate the
				// volume with data, if a non-empty volume is desired. This may
				// be any object from a non-empty API group (non core object) or
				// a PersistentVolumeClaim object. When this field is specified,
				// volume binding will only succeed if the type of the specified
				// object matches some installed volume populator or dynamic
				// provisioner. This field will replace the functionality of the
				// dataSource field and as such if both fields are non-empty,
				// they must have the same value. For backwards compatibility,
				// when namespace isn't specified in dataSourceRef, both fields
				// (dataSource and dataSourceRef) will be set to the same value
				// automatically if one of them is empty and the other is
				// non-empty. When namespace is specified in dataSourceRef,
				// dataSource isn't set to the same value and must be empty.
				// There are three important differences between dataSource and
				// dataSourceRef: * While dataSource only allows two specific
				// types of objects, dataSourceRef allows any non-core object, as
				// well as PersistentVolumeClaim objects. * While dataSource
				// ignores disallowed values (dropping them), dataSourceRef
				// preserves all values, and generates an error if a disallowed
				// value is specified. * While dataSource only allows local
				// objects, dataSourceRef allows objects in any namespaces.
				// (Beta) Using this field requires the AnyVolumeDataSource
				// feature gate to be enabled. (Alpha) Using the namespace field
				// of dataSourceRef requires the CrossNamespaceVolumeDataSource
				// feature gate to be enabled.
				dataSourceRef?: {
					// APIGroup is the group for the resource being referenced. If
					// APIGroup is not specified, the specified Kind must be in the
					// core API group. For any other third-party types, APIGroup is
					// required.
					apiGroup?: string

					// Kind is the type of resource being referenced
					kind: string

					// Name is the name of resource being referenced
					name: string

					// Namespace is the namespace of resource being referenced Note
					// that when a namespace is specified, a
					// gateway.networking.k8s.io/ReferenceGrant object is required in
					// the referent namespace to allow that namespace's owner to
					// accept the reference. See the ReferenceGrant documentation for
					// details. (Alpha) This field requires the
					// CrossNamespaceVolumeDataSource feature gate to be enabled.
					namespace?: string
					...
				}

				// resources represents the minimum resources the volume should
				// have. If RecoverVolumeExpansionFailure feature is enabled
				// users are allowed to specify resource requirements that are
				// lower than previous value but must still be higher than
				// capacity recorded in the status field of the claim. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources
				resources?: {
					// Claims lists the names of resources, defined in
					// spec.resourceClaims, that are used by this container.
					// This is an alpha field and requires enabling the
					// DynamicResourceAllocation feature gate.
					// This field is immutable. It can only be set for containers.
					claims?: [...{
						// Name must match the name of one entry in
						// pod.spec.resourceClaims of the Pod where this field is used.
						// It makes that resource available inside a container.
						name: string
						...
					}]

					// Limits describes the maximum amount of compute resources
					// allowed. More info:
					// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
					limits?: {
						[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					}

					// Requests describes the minimum amount of compute resources
					// required. If Requests is omitted for a container, it defaults
					// to Limits if that is explicitly specified, otherwise to an
					// implementation-defined value. Requests cannot exceed Limits.
					// More info:
					// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
					requests?: {
						[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					}
					...
				}

				// selector is a label query over volumes to consider for binding.
				selector?: {
					// matchExpressions is a list of label selector requirements. The
					// requirements are ANDed.
					matchExpressions?: [...{
						// key is the label key that the selector applies to.
						key: string

						// operator represents a key's relationship to a set of values.
						// Valid operators are In, NotIn, Exists and DoesNotExist.
						operator: string

						// values is an array of string values. If the operator is In or
						// NotIn, the values array must be non-empty. If the operator is
						// Exists or DoesNotExist, the values array must be empty. This
						// array is replaced during a strategic merge patch.
						values?: [...string]
						...
					}]

					// matchLabels is a map of {key,value} pairs. A single {key,value}
					// in the matchLabels map is equivalent to an element of
					// matchExpressions, whose key field is "key", the operator is
					// "In", and the values array contains only "value". The
					// requirements are ANDed.
					matchLabels?: {
						[string]: string
					}
					...
				}

				// storageClassName is the name of the StorageClass required by
				// the claim. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
				storageClassName?: string

				// volumeMode defines what type of volume is required by the
				// claim. Value of Filesystem is implied when not included in
				// claim spec.
				volumeMode?: string

				// volumeName is the binding reference to the PersistentVolume
				// backing this claim.
				volumeName?: string
				...
			}

			// Resize existent PVCs, defaults to true
			resizeInUseVolumes?: bool | *true

			// Size of the storage. Required if not already specified in the
			// PVC template. Changes to this field are automatically
			// reapplied to the created PVCs. Size cannot be decreased.
			size?: string

			// StorageClass to use for database data (`PGDATA`). Applied after
			// evaluating the PVC template, if available. If not specified,
			// generated PVCs will be satisfied by the default storage class
			storageClass?: string
			...
		}

		// The secret containing the superuser password. If not defined a
		// new secret will be created with a randomly generated password
		superuserSecret?: {
			// Name of the referent.
			name: string
			...
		}

		// The time in seconds that is allowed for a primary PostgreSQL
		// instance to gracefully shutdown during a switchover. Default
		// value is 3600 seconds (1 hour).
		switchoverDelay?: int | *3600

		// TopologySpreadConstraints specifies how to spread matching pods
		// among the given topology. More info:
		// https://kubernetes.io/docs/concepts/scheduling-eviction/topology-spread-constraints/
		topologySpreadConstraints?: [...{
			// LabelSelector is used to find matching pods. Pods that match
			// this label selector are counted to determine the number of
			// pods in their corresponding topology domain.
			labelSelector?: {
				// matchExpressions is a list of label selector requirements. The
				// requirements are ANDed.
				matchExpressions?: [...{
					// key is the label key that the selector applies to.
					key: string

					// operator represents a key's relationship to a set of values.
					// Valid operators are In, NotIn, Exists and DoesNotExist.
					operator: string

					// values is an array of string values. If the operator is In or
					// NotIn, the values array must be non-empty. If the operator is
					// Exists or DoesNotExist, the values array must be empty. This
					// array is replaced during a strategic merge patch.
					values?: [...string]
					...
				}]

				// matchLabels is a map of {key,value} pairs. A single {key,value}
				// in the matchLabels map is equivalent to an element of
				// matchExpressions, whose key field is "key", the operator is
				// "In", and the values array contains only "value". The
				// requirements are ANDed.
				matchLabels?: {
					[string]: string
				}
				...
			}

			// MatchLabelKeys is a set of pod label keys to select the pods
			// over which spreading will be calculated. The keys are used to
			// lookup values from the incoming pod labels, those key-value
			// labels are ANDed with labelSelector to select the group of
			// existing pods over which spreading will be calculated for the
			// incoming pod. The same key is forbidden to exist in both
			// MatchLabelKeys and LabelSelector. MatchLabelKeys cannot be set
			// when LabelSelector isn't set. Keys that don't exist in the
			// incoming pod labels will be ignored. A null or empty list
			// means only match against labelSelector.
			// This is a beta field and requires the
			// MatchLabelKeysInPodTopologySpread feature gate to be enabled
			// (enabled by default).
			matchLabelKeys?: [...string]

			// MaxSkew describes the degree to which pods may be unevenly
			// distributed. When `whenUnsatisfiable=DoNotSchedule`, it is the
			// maximum permitted difference between the number of matching
			// pods in the target topology and the global minimum. The global
			// minimum is the minimum number of matching pods in an eligible
			// domain or zero if the number of eligible domains is less than
			// MinDomains. For example, in a 3-zone cluster, MaxSkew is set
			// to 1, and pods with the same labelSelector spread as 2/2/1: In
			// this case, the global minimum is 1. | zone1 | zone2 | zone3 |
			// | P P | P P | P | - if MaxSkew is 1, incoming pod can only be
			// scheduled to zone3 to become 2/2/2; scheduling it onto
			// zone1(zone2) would make the ActualSkew(3-1) on zone1(zone2)
			// violate MaxSkew(1). - if MaxSkew is 2, incoming pod can be
			// scheduled onto any zone. When
			// `whenUnsatisfiable=ScheduleAnyway`, it is used to give higher
			// precedence to topologies that satisfy it. It's a required
			// field. Default value is 1 and 0 is not allowed.
			maxSkew: int

			// MinDomains indicates a minimum number of eligible domains. When
			// the number of eligible domains with matching topology keys is
			// less than minDomains, Pod Topology Spread treats "global
			// minimum" as 0, and then the calculation of Skew is performed.
			// And when the number of eligible domains with matching topology
			// keys equals or greater than minDomains, this value has no
			// effect on scheduling. As a result, when the number of eligible
			// domains is less than minDomains, scheduler won't schedule more
			// than maxSkew Pods to those domains. If value is nil, the
			// constraint behaves as if MinDomains is equal to 1. Valid
			// values are integers greater than 0. When value is not nil,
			// WhenUnsatisfiable must be DoNotSchedule.
			// For example, in a 3-zone cluster, MaxSkew is set to 2,
			// MinDomains is set to 5 and pods with the same labelSelector
			// spread as 2/2/2: | zone1 | zone2 | zone3 | | P P | P P | P P |
			// The number of domains is less than 5(MinDomains), so "global
			// minimum" is treated as 0. In this situation, new pod with the
			// same labelSelector cannot be scheduled, because computed skew
			// will be 3(3 - 0) if new Pod is scheduled to any of the three
			// zones, it will violate MaxSkew.
			// This is a beta field and requires the
			// MinDomainsInPodTopologySpread feature gate to be enabled
			// (enabled by default).
			minDomains?: int

			// NodeAffinityPolicy indicates how we will treat Pod's
			// nodeAffinity/nodeSelector when calculating pod topology spread
			// skew. Options are: - Honor: only nodes matching
			// nodeAffinity/nodeSelector are included in the calculations. -
			// Ignore: nodeAffinity/nodeSelector are ignored. All nodes are
			// included in the calculations.
			// If this value is nil, the behavior is equivalent to the Honor
			// policy. This is a beta-level feature default enabled by the
			// NodeInclusionPolicyInPodTopologySpread feature flag.
			nodeAffinityPolicy?: string

			// NodeTaintsPolicy indicates how we will treat node taints when
			// calculating pod topology spread skew. Options are: - Honor:
			// nodes without taints, along with tainted nodes for which the
			// incoming pod has a toleration, are included. - Ignore: node
			// taints are ignored. All nodes are included.
			// If this value is nil, the behavior is equivalent to the Ignore
			// policy. This is a beta-level feature default enabled by the
			// NodeInclusionPolicyInPodTopologySpread feature flag.
			nodeTaintsPolicy?: string

			// TopologyKey is the key of node labels. Nodes that have a label
			// with this key and identical values are considered to be in the
			// same topology. We consider each <key, value> as a "bucket",
			// and try to put balanced number of pods into each bucket. We
			// define a domain as a particular instance of a topology. Also,
			// we define an eligible domain as a domain whose nodes meet the
			// requirements of nodeAffinityPolicy and nodeTaintsPolicy. e.g.
			// If TopologyKey is "kubernetes.io/hostname", each Node is a
			// domain of that topology. And, if TopologyKey is
			// "topology.kubernetes.io/zone", each zone is a domain of that
			// topology. It's a required field.
			topologyKey: string

			// WhenUnsatisfiable indicates how to deal with a pod if it
			// doesn't satisfy the spread constraint. - DoNotSchedule
			// (default) tells the scheduler not to schedule it. -
			// ScheduleAnyway tells the scheduler to schedule the pod in any
			// location, but giving higher precedence to topologies that
			// would help reduce the skew. A constraint is considered
			// "Unsatisfiable" for an incoming pod if and only if every
			// possible node assignment for that pod would violate "MaxSkew"
			// on some topology. For example, in a 3-zone cluster, MaxSkew is
			// set to 1, and pods with the same labelSelector spread as
			// 3/1/1: | zone1 | zone2 | zone3 | | P P P | P | P | If
			// WhenUnsatisfiable is set to DoNotSchedule, incoming pod can
			// only be scheduled to zone2(zone3) to become 3/2/1(3/1/2) as
			// ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other
			// words, the cluster can still be imbalanced, but scheduler
			// won't make it *more* imbalanced. It's a required field.
			whenUnsatisfiable: string
			...
		}]

		// Configuration of the storage for PostgreSQL WAL (Write-Ahead
		// Log)
		walStorage?: {
			// Template to be used to generate the Persistent Volume Claim
			pvcTemplate?: {
				// accessModes contains the desired access modes the volume should
				// have. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
				accessModes?: [...string]

				// dataSource field can be used to specify either: * An existing
				// VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot)
				// * An existing PVC (PersistentVolumeClaim) If the provisioner
				// or an external controller can support the specified data
				// source, it will create a new volume based on the contents of
				// the specified data source. When the AnyVolumeDataSource
				// feature gate is enabled, dataSource contents will be copied to
				// dataSourceRef, and dataSourceRef contents will be copied to
				// dataSource when dataSourceRef.namespace is not specified. If
				// the namespace is specified, then dataSourceRef will not be
				// copied to dataSource.
				dataSource?: {
					// APIGroup is the group for the resource being referenced. If
					// APIGroup is not specified, the specified Kind must be in the
					// core API group. For any other third-party types, APIGroup is
					// required.
					apiGroup?: string

					// Kind is the type of resource being referenced
					kind: string

					// Name is the name of resource being referenced
					name: string
					...
				}

				// dataSourceRef specifies the object from which to populate the
				// volume with data, if a non-empty volume is desired. This may
				// be any object from a non-empty API group (non core object) or
				// a PersistentVolumeClaim object. When this field is specified,
				// volume binding will only succeed if the type of the specified
				// object matches some installed volume populator or dynamic
				// provisioner. This field will replace the functionality of the
				// dataSource field and as such if both fields are non-empty,
				// they must have the same value. For backwards compatibility,
				// when namespace isn't specified in dataSourceRef, both fields
				// (dataSource and dataSourceRef) will be set to the same value
				// automatically if one of them is empty and the other is
				// non-empty. When namespace is specified in dataSourceRef,
				// dataSource isn't set to the same value and must be empty.
				// There are three important differences between dataSource and
				// dataSourceRef: * While dataSource only allows two specific
				// types of objects, dataSourceRef allows any non-core object, as
				// well as PersistentVolumeClaim objects. * While dataSource
				// ignores disallowed values (dropping them), dataSourceRef
				// preserves all values, and generates an error if a disallowed
				// value is specified. * While dataSource only allows local
				// objects, dataSourceRef allows objects in any namespaces.
				// (Beta) Using this field requires the AnyVolumeDataSource
				// feature gate to be enabled. (Alpha) Using the namespace field
				// of dataSourceRef requires the CrossNamespaceVolumeDataSource
				// feature gate to be enabled.
				dataSourceRef?: {
					// APIGroup is the group for the resource being referenced. If
					// APIGroup is not specified, the specified Kind must be in the
					// core API group. For any other third-party types, APIGroup is
					// required.
					apiGroup?: string

					// Kind is the type of resource being referenced
					kind: string

					// Name is the name of resource being referenced
					name: string

					// Namespace is the namespace of resource being referenced Note
					// that when a namespace is specified, a
					// gateway.networking.k8s.io/ReferenceGrant object is required in
					// the referent namespace to allow that namespace's owner to
					// accept the reference. See the ReferenceGrant documentation for
					// details. (Alpha) This field requires the
					// CrossNamespaceVolumeDataSource feature gate to be enabled.
					namespace?: string
					...
				}

				// resources represents the minimum resources the volume should
				// have. If RecoverVolumeExpansionFailure feature is enabled
				// users are allowed to specify resource requirements that are
				// lower than previous value but must still be higher than
				// capacity recorded in the status field of the claim. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources
				resources?: {
					// Claims lists the names of resources, defined in
					// spec.resourceClaims, that are used by this container.
					// This is an alpha field and requires enabling the
					// DynamicResourceAllocation feature gate.
					// This field is immutable. It can only be set for containers.
					claims?: [...{
						// Name must match the name of one entry in
						// pod.spec.resourceClaims of the Pod where this field is used.
						// It makes that resource available inside a container.
						name: string
						...
					}]

					// Limits describes the maximum amount of compute resources
					// allowed. More info:
					// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
					limits?: {
						[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					}

					// Requests describes the minimum amount of compute resources
					// required. If Requests is omitted for a container, it defaults
					// to Limits if that is explicitly specified, otherwise to an
					// implementation-defined value. Requests cannot exceed Limits.
					// More info:
					// https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
					requests?: {
						[string]: (int | string) & =~"^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
					}
					...
				}

				// selector is a label query over volumes to consider for binding.
				selector?: {
					// matchExpressions is a list of label selector requirements. The
					// requirements are ANDed.
					matchExpressions?: [...{
						// key is the label key that the selector applies to.
						key: string

						// operator represents a key's relationship to a set of values.
						// Valid operators are In, NotIn, Exists and DoesNotExist.
						operator: string

						// values is an array of string values. If the operator is In or
						// NotIn, the values array must be non-empty. If the operator is
						// Exists or DoesNotExist, the values array must be empty. This
						// array is replaced during a strategic merge patch.
						values?: [...string]
						...
					}]

					// matchLabels is a map of {key,value} pairs. A single {key,value}
					// in the matchLabels map is equivalent to an element of
					// matchExpressions, whose key field is "key", the operator is
					// "In", and the values array contains only "value". The
					// requirements are ANDed.
					matchLabels?: {
						[string]: string
					}
					...
				}

				// storageClassName is the name of the StorageClass required by
				// the claim. More info:
				// https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
				storageClassName?: string

				// volumeMode defines what type of volume is required by the
				// claim. Value of Filesystem is implied when not included in
				// claim spec.
				volumeMode?: string

				// volumeName is the binding reference to the PersistentVolume
				// backing this claim.
				volumeName?: string
				...
			}

			// Resize existent PVCs, defaults to true
			resizeInUseVolumes?: bool | *true

			// Size of the storage. Required if not already specified in the
			// PVC template. Changes to this field are automatically
			// reapplied to the created PVCs. Size cannot be decreased.
			size?: string

			// StorageClass to use for database data (`PGDATA`). Applied after
			// evaluating the PVC template, if available. If not specified,
			// generated PVCs will be satisfied by the default storage class
			storageClass?: string
			...
		}
		...
	}

}
