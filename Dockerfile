FROM vlaamseoverheid-magda-docker-releases.jfrog.io/magda/magda.magdamock:0.22.1

COPY ./application.yml application.yml

COPY ./rest /data/rest
COPY ./soap /data/soap

EXPOSE 8080
EXPOSE 8081
