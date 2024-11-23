sh pegadockerlogin
docker pull pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image:1.0.5-<build-tag>
docker tag pega-docker.downloads.pega.com/constellation-appstatic-service/docker-image:1.0.5-<build-tag> <Registry host name:Port>/pega-c11n-app-static:8.8.0-ga
docker push <Registry host name:Port>/pega-c11n-app-static:8.8.0-ga