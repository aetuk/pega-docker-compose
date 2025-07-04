# pega-docker-compose
Docker-compose files that will help you install Pega environment for your development, non-production needs. 
For environments where 1 vm container = 1 pega instance this works great. Please validate and test before using as your new production environment. 
For production ready setup based on k8s please follow instructions prodived by Pegasystems: [pega-helm-charts](https://github.com/pegasystems/pega-helm-charts)

## Building images
Following images are required to proceed:
* Pega Install - `PEGA_INSTALL_IMAGE`  ([how to build an install image]( https://github.com/pegasystems/pega-helm-charts/blob/master/docs/building-your-own-Pega-installer-image.md))
* Pega - `PEGA_RUN_IMAGE` (publicly available on docker hub)
* Constellation UI - `CONSTELLATION_RUN_IMAGE` ([how to get an image](https://documents.constellation.pega.io/static/86-87/constellationui-static-service-docker.html))

## Step-by-step guide
### Make DNS records for domain and subdomains (Optional):
* constellation.`[domain]`
* pega-web.`[domain]`
* pega-cdh.`[domain]` (if need CDH)
* pdm.`[domain]` (if need PDM)

### SSH to the server and clone repo:
```
# git clone https://github.com/aetuk/pega-docker-compose.git
```
### Prepare part 1 - Setup Docker & Docker Compose
https://docs.docker.com/engine/install/

https://docs.docker.com/compose/install/


### Prepare part 2 - Download images

1. Run script  ```# sh prep_docker_download_all.sh```
2. Run command ```# docker images```, to validate that all the images are in your system  

Login into your docker registry, e.g Docker Hub, where you have Pega and Constellation Images.

```# docker login```
### Install common part
1. `cd pega-docker-compose/common/`
2. Edit `docker-compose.yml`
   * Change `URL` to your domain name
   * Change `EMAIL` to your email
   * Change `SUBDOMAINS` to subdomains you created DNS records for, e.g `pega24-web,pega24-cdh,constellation88,pdm`

3. Run `$ docker-compose up -d`
4. Check `$ docker logs swag -f` to see if there any errors
5. `$ cp *.conf appdata/swag/nginx/proxy-confs`
6. `$ docker restart swag`


### Install Basic Pega
1. `cd pega-docker-compose/pega24/`
2. Edit `.env`. Leave the default password or us passwords Without special characters (For postgre db copy example .env.post.example file - .env.ora.example for oracle)
    * POSTGRES_PASSWORD=SomeGeneratedPassword
    * ADMIN_PASSWORD=SomeGeneratedPassword
    * PEGA_INSTALL_IMAGE=ImageYouBuildAndPushed
3. `# . install.sh`. It will take around 20-30 minutes.
4. `# docker-compose up -d`
5. `$ cp *.conf ../common/appdata/swag/nginx/proxy-confs`
6. `$ docker restart swag`
7. Login using administrator@pega.com with password from `.env`
8. Update `ConstellationPegaStaticURL` DSS to `https://release.constellation.pega.io`
9. Update `ConstellationSvcURL` DSS to `https://constellation[version].[domain]/c11n-appstatic`
10. `$ docker restart pega[version]-[web/cdh]`
11. Clean cache and cookies just to be sure

You can finish there

## Common
Before anything update enviromental variables in `.env` file.

Run `$ docker-compose up -d` to start containers that are shared between all Pega containers:
* NGINX Reverse Proxy (swag)
* Constellation UI
* Adminer
* Kafka with Zookeper

### NGINX Reverse Proxy (swag)
Taking care of certifications and subdomain routing. Configure environment variables in yaml file. Copy `*.conf` files to `common/appdata/swag/nginx/proxy-confs/`:
```
cp common/*.conf common/appdata/swag/nginx/proxy-confs
```

More info ([here](https://docs.linuxserver.io/general/swag))

### Constellation UI
Update `CONSTELLATION_RUN_IMAGE` variable in `.env`. Update `ConstellationSvcURL` DSS on taget applications with URL to it. 

### Adminer
Doesn't require much configuration, all database connections are stored on the client side.

## Pega`[version]`
Before anything update environment variables in `.env` file.`

Contains:
* Installer for Web and CDH instances 
* Web and CDH instances
* Cassandra

### Installer for Web and CDH instances
Before the first run Pega should be installed to the databases by running 

```
$ sh install.sh
```
 or
```
$ docker-compose run pega[version]-web-install
$ docker-compose --profile cdh run pega[version]-cdh-install
```

### Web and CDH instances
Copy `*.subdomain.conf` files to `common/appdata/swag/nginx/proxy-confs/`:

```
cp pega[version]/*.conf common/appdata/swag/nginx/proxy-confs
```

Run `$ docker-compose up -d` to start Web instance.

Run `$ docker-compose --profile cdh up -d` to start Web and CDH instances.


Do not forget to update DSSs for Kafka, Constellation, ExternalMKTData.

You will have to manually install Pega CDH itself from marketplace.

### Cassandra
Parameters to connect to Cassandra are automatically passed to CDH instance. No need for an additional configuration.

## Pega Deployment Manager Orchestrator (PDM)

Not really required, but nice to play with.

Copy `*.subdomain.conf` files to `common/appdata/swag/nginx/proxy-confs/`

```
cp pega-pdm/*.conf common/appdata/swag/nginx/proxy-confs
```

In order to install Pega Platform for Pega Deployment Manager run `$ docker-compose run pdm-install`

Then just run `$ docker-compose up -d`

You will have to manually install Pega Deployment Manager Orchestrator itself from marketplace.
