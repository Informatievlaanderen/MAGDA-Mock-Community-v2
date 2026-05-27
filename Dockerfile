FROM vlaamseoverheid-magda-docker-releases.jfrog.io/magda/magda.magdamock:0.8.0

COPY ./application.yml application.yml

COPY ./wiremock-data /data/wiremock
COPY ./soap /data/soap

EXPOSE 8080
EXPOSE 8081
