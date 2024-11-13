#Please update
PEGA_DIST_LOC=./
#Please update
PEGA_DIST=118023_Pega_24.2
#Please update
DOCKER_USER=user
#Please update
DOCKER_PASS=pass
unzip ${PEGA_DIST}${PEGA_DIST_LOC}.zip
docker login -u $DOCKER_USER -p $DOCKER_PASS
cd ./$PEGA_DIST/
FROM pegasystems/pega-installer-ready
COPY --chown=pegauser:root scripts /opt/pega/kit/scripts
COPY --chown=pegauser:root archives /opt/pega/kit/archives
COPY --chown=pegauser:root rules /opt/pega/kit/rules
# cp dockerfile <local filepath>/<platform>-demo/<pega-distribution-image>
# docker build -t pega-installer .
# docker tag pega-installer <your-dockerhub-ID>/pega-installer
# wait - create private docker repo
# docker push <your-dockerhub-ID>/pega-installer
