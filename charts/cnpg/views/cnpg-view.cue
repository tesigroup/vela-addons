// We put VelaQL views in views directory.
//
// VelaQL(Vela Query Language) is a resource query language for KubeVela, 
// used to query status of any extended resources in application-level.
// Reference: https://kubevela.net/docs/platform-engineers/system-operation/velaql
//
// This VelaQL View querys the status of this addon.
// Use this view to query by:
//     vela ql --query 'my-view{addonName:cnpg}.status'
// You should see 'running'.

import (
	"vela/ql"
)

app: ql.#Read & {
	value: {
		kind:       "Application"
		apiVersion: "core.oam.dev/v1beta1"
		metadata: {
			name:      "addon-" + parameter.addonName
			namespace: "vela-system"
		}
	}
}

parameter: {
	addonName: *"cnpg" | string
}

status: app.value.status.status
