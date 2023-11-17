output: {
	name: "psmdb-operator"
	type: "helm"
	properties: {
		repoType:        "helm"
		url:             "https://percona.github.io/percona-helm-charts/"
		chart:           "psmdb-operator"
		version:         "1.15.0"
		targetNamespace: parameter.namespace
		values: {
			disableTelemetry:   true
			watchAllNamespaces: true
		}
	}
}
