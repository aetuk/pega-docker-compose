PEGA_REG=reg-XXXXX
cat pegadockerkey.txt | docker login pega-docker.downloads.pega.com --username=$PEGA_REG --password-stdin
