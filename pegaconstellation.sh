sh pegadockerlogin
BUILD_TAG="abc123"
REGISTRY_HOSTNAME="abcd"
REGISTRY_PORT=1234
docker pull pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image:1.0.5-$BUILD_TAG
docker tag pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image:1.0.5-$BUILD_TAG $REGISTRY_HOSTNAME:$REGISTRY_PORT/pega-c11n-app-static:8.8.0-ga
docker push $REGISTRY_HOSTNAME:$REGISTRY_PORT/pega-c11n-app-static:8.8.0-ga