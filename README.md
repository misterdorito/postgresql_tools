# postgresql_tools
Postgresql (version-specific) client tooling intended to be used via exec-ing into k8s-hosted container.  Everything below assumes that you have kubectl and a valid kube config.  This is intended to be used for debugging purposes. 

Docker image available at https://hub.docker.com/repository/docker/primedorito/postgresql_tools.

## Deploying container to a k8s cluster
To deploy this container you can:

```
kubectl -n <namespace> apply -f https://raw.githubusercontent.com/misterdorito/postgresql_tools/master/k8s/pg_tools_[version].yml
```
[version] should be replaced with the desired PostgreSQL version -- 9.4, 9.5, 9.6, 11 or 12.

## Using container to query a Postgresql DB:
To query a db:

```
kubectl -n <namespace> get pods                    (note your postgresql-tools pod name)
kubectl exec -n <namespace> exec -i -t <pod-name> -- /bin/bash

psql -h <db hostname> -d <db name> -p <db port number> -U <postgresql user>
```

## Special note on using pg_repack
These docker images contain pg_repack. While installing pg_repack it installs tzdata as a dependency.  tzdata requires you to specify a default time zone.  By default this is set to "America/New_York". To change the default timezone to the one used by your db, run the following command from within the container and follow the prompts:
```
   dpkg-configure tzdata
```

## To undeploy container
To remove the container once you're done with it:

```
kubectl -n <namespace> delete deployment postgresql-tools
```

## To deploy this container via helm
To deploy this container via helm, check out https://github.com/misterdorito/postgresql_tools_chart .
