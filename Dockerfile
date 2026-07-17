ARG MAGDAMOCK_VERSION="0.22.1"
ARG CONTAINER_NAME="vlaamseoverheid-magda-docker-releases.jfrog.io/magda/magda.magdamock"
FROM ${CONTAINER_NAME}:${MAGDAMOCK_VERSION}

COPY ./application.yml application.yml

COPY ./rest /data/rest
COPY ./soap /data/soap

EXPOSE 8080
EXPOSE 8081
