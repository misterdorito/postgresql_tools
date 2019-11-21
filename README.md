# postgresql_tools
Postgresql client tooling intended to be used via exec-ing into k8s-hosted container.  Everything below assumes that you have kubectl and a valid kube config.  This is intended to be used for debugging purposes. 

## Deploying container to a K8s cluster
To deploy this container you can:

```
kubectl -n <namespace> apply -f https://raw.githubusercontent.com/misterdorito/postgresql_tools/master/yml/pg_tools.yml
```

## Using container to query a Postgresql DB:

```
kubectl -n <namespace> get pods                    (note your postgresql-tools pod name)
kubectl exec -n <namespace> exec -i -t <pod-name> -- /bin/bash

psql -h <db hostname> -d <db name> -p <db port number> -U <postgresql user>
```
