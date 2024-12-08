sh pegadockerlogin
docker pull pega-docker.downloads.pega.com/platform/pega:<latest Infinity version>
docker tag pega-docker.downloads.pega.com/platform/pega:<latest Infinity version> <Registry host name:Port>/pega:8.8.0-ga
docker push <Registry host name:Port>/pega:8.8.0-ga