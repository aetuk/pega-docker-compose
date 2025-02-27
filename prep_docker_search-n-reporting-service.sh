sh pegadockerlogin.sh
REGISTRY_NAME="kuzdune4/search-n-reporting-service"
docker pull pega-docker.downloads.pega.com/platform-services/search-n-reporting-service:1.37.3
sh pegaconsuserdockerlogin.sh
docker tag pega-docker.downloads.pega.com/platform-services/search-n-reporting-service:1.37.3 $REGISTRY_NAME
docker push $REGISTRY_NAME