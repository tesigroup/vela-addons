output: {
	name: "cnpg"
	type: "helm"
	properties: {
		repoType: "helm"
		url:      "https://cloudnative-pg.github.io/charts"
		chart:    "cloudnative-pg"
		version:  "0.19.1"
		targetNamespace: parameter.namespace
	}
}