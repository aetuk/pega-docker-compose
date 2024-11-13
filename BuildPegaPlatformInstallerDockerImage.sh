#Please update
PEGA_DIST_LOC=./
#Please update
PEGA_DIST=118023_Pega_24.2
#Please update
DOCKERHUB_ID=dockerhubid
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
cp dockerfile .
docker build -t pega-installer .
docker tag pega-installer $DOCKERHUB_ID/pega-installer
# wait - create private docker repo
pause
docker push $DOCKERHUB_ID/pega-installer