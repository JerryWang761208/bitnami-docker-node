## BUILDING
##   (from project root directory)
##   $ docker build -t bitnami-bitnami-docker-node .
##
## RUNNING
##   $ docker run -p 3000:3000 bitnami-bitnami-docker-node
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="2eg0n7n" \
    STACKSMITH_STACK_NAME="bitnami/bitnami-docker-node" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install node-6.3.0-0 --checksum f2997c421e45beb752673a531bf475231d183c30f7f8d5ec1a5fb68d39744d5f

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

RUN bitnami-pkg install imagemagick-6.7.5-10-3 --checksum 617e85a42c80f58c568f9bc7337e24c03e35cf4c7c22640407a7e1e16880cf88
RUN bitnami-pkg install mysql-libraries-10.1.13-0 --checksum 71ca428b619901123493503f8a99ccfa588e5afddd26e0d503a32cca1bc2a389

ENV BITNAMI_APP_NAME=node \
    BITNAMI_IMAGE_VERSION=6.3.0-r0

EXPOSE 3000
WORKDIR /app

CMD ["node"]
