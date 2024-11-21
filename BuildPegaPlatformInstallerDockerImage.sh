PEGA_SOURCE_LOC=/home/aetuk/Downloads/
#Please update
PEGA_DIST_LOC=/home/aetuk/Pega86Temp/
#Please update
PEGA_FILE=Pegatest1
#Please update
DOCKERHUB_ID=dockerhubid
#Please update
DOCKER_USER=user
#Please update
DOCKER_PASS=password
unzip ${PEGA_SOURCE_LOC}${PEGA_FILE}.zip -d ${PEGA_DIST_LOC}
docker login -u $DOCKER_USER -p $DOCKER_PASS
cd $PEGA_DIST_LOC
cd $PEGA_DIST_LOC/*/
cp dockerfile . 
docker build -t pega-installer .
docker tag pega-installer $DOCKERHUB_ID/pega-installer
# wait - create private docker repo
read -p "Please ensure that your docker hub destination is private. Press enter to continue"
docker push $DOCKERHUB_ID/pega-installer
