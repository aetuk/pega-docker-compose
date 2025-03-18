CONS_REGISTRY_NAME="kuzdune/constellation"
INSTALL_REGISTRY_NAME="kuzdune2/installer"
REP_REGISTRY_NAME="kuzdune4/search-n-reporting-service"

sh userdockerlogin_pegainstaller.sh
docker pull $INSTALL_REGISTRY_NAME
sh userdockerlogin_pegacons.sh
docker pull $CONS_REGISTRY_NAME
sh userdockerlogin_pegasearch.sh
docker pull $REP_REGISTRY_NAME
