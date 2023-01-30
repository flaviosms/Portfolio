# Port foward Kuberapps:
kubectl port-forward -n kubeapps svc/kubeapps 8080:80

# Acess postgrepod
Install Postgresql via Kubeapps

kubectl exec -it --namespace=ingestion database-postgresql-0 -- /opt/bitnami/scripts/postgresql/entrypoint.sh /bin/bash

# Namespace

helm install strimzi-kafka strimzi/strimzi-kafka-operator --version 0.32.0

helm uninstall strimzi-kafka


## Installing Spark on k8s

helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install spark-release spark-operator/spark-operator --namespace spark-operator --create-namespace

kubectl create serviceaccount spark

kubectl create clusterrolebinding spark-role --clusterrole=edit --serviceaccount=default:spark --namespace=default