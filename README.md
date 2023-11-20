# Tesi Group Vela Addons

## Catalog

```
https://tesigroup.github.io/vela-addons/
```

## Recommendations

Avoid long addon names as they will be broken when installed from registry (percona-server-mongodb-operator is too long).

## Importing CRDS

A quick way to import CRDs into cue is to collect openAPIV3Schema section and pasting it into a yaml file.
Then convert the json schema using:

```bash
cue import -p main -l '#CRD:' jsonschema: crd.yaml
```
