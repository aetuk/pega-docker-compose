sh pegadockerlogin.sh
REGISTRY_NAME="kuzdune3/clustering-service"
docker pull pega-docker.downloads.pega.com/platform/clustering-service
sh pegaconsuserdockerlogin.sh
docker tag pega-docker.downloads.pega.com/platform/clustering-service $REGISTRY_NAME
docker push $REGISTRY_NAME