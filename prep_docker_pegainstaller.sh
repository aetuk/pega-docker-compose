sh pegadockerlogin
BUILD_TAG="abc123"
REGISTRY_HOSTNAME="abcd"
REGISTRY_PORT=1234
VERSION=1.0.1
docker pull pega-docker.downloads.pega.com/platform/pega:$VERSION
docker tag pega-docker.downloads.pega.com/platform/pega:$VERSION $REGISTRY_HOSTNAME:$REGISTRY_PORT/pega:8.8.0-ga
docker push $REGISTRY_HOSTNAME:$REGISTRY_PORT/pega:8.8.0-ga