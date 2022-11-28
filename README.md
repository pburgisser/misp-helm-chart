# Helm chart for MISP
This chart helps to deploy the MISP on Kubernetes using specific images made to scale

## Disclaimer
It's a v1 of the chart where all parameters that are usually stored in *config.php*, *bootstrap.php*, *core.php*, *database.php*, *routes.php*, *email.php* are managed outside of this chart.
To deploy the default values, use the following commands:
```shell
# Bootstrap
curl -o /tmp/bootstrap.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/bootstrap.default.php
kubectl create configmap application-bootstrap --from-file=bootstrap.php=/tmp/bootstrap.php

# Config
curl -o /tmp/config.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/config.default.php
kubectl create configmap application-config --from-file=config.php=/tmp/config.php --from-literal=redis_host=redi_url

# Core
curl -o /tmp/core.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/core.default.php
kubectl create configmap application-core --from-file=core.php=/tmp/core.php

# database
curl -o /tmp/database.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/database.default.php
kubectl create secret generic database --from-file=database.php=/tmp/database.php

# email
curl -o /tmp/email.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/email.php
kubectl create configmap application-email --from-file=email.php=/tmp/email.php

# Routes
curl -o /tmp/routes.php https://raw.githubusercontent.com/MISP/MISP/2.4/app/Config/routes.php
kubectl create configmap application-routes --from-file=routes.php=/tmp/routes.php

```

## Installation
1. Add the repository
```shell
helm repo add misp https://pburgisser.github.io/misp-helm-chart/
```
2. Install the MISP with the default values:
```shell
helm install my-misp misp/misp
```
