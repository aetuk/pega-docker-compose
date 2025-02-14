sh pegadockerlogin.sh
REGISTRY_NAME="kuzdune2/installer"
docker pull pega-docker.downloads.pega.com/platform/installer:
sh pegapegauserdockerlogin.sh
docker tag pega-docker.downloads.pega.com/platform/installer $REGISTRY_NAME
docker push $REGISTRY_NAME