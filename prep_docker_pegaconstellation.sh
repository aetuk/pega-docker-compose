sh pegadockerlogin.sh
REGISTRY_NAME="kuzdune/constellation"
docker pull pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image
sh pegaconsuserdockerlogin.sh
docker tag pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image $REGISTRY_NAME
docker push $REGISTRY_NAME