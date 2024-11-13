# unzip ./<pega-distribution-image>.zip
# docker login -u <username> -p <username-password>
# cd ./<pega-distribution-image>/
FROM pegasystems/pega-installer-ready
COPY --chown=pegauser:root scripts /opt/pega/kit/scripts
COPY --chown=pegauser:root archives /opt/pega/kit/archives
COPY --chown=pegauser:root rules /opt/pega/kit/rules
#cp dockerfile <local filepath>/<platform>-demo/<pega-distribution-image>
# docker build -t pega-installer .
# docker tag pega-installer <your-dockerhub-ID>/pega-installer
# wait - create private docker repo
# docker push <your-dockerhub-ID>/pega-installer
