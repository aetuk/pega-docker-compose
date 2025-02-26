sh pegadockerlogin.sh
REGISTRY_NAME="kuzdune4/search-n-reporting-service"
docker pull pega-docker.downloads.pega.com/platform-services/search-n-reporting-service
sh pegaconsuserdockerlogin.sh
docker tag pega-docker.downloads.pega.com/platform-services/search-n-reporting-service $REGISTRY_NAME
docker push $REGISTRY_NAME