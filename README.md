# Magda Mock Community

This repository serves as an example on how to setup the magdamock.
The data in here comes from https://vlaamseoverheid.atlassian.net/wiki/spaces/MG/pages/8567914962/MAGDA+Mock+-+Overzicht+diensten .

## Important data

Underneath are the most important folders and files.

### Folders

- `rest`: in here the REST data is stored, according to the folder mappings as mentioned in confluence
- `soap`: in here the SOAP data is stored, according to the folder mappings as mentioned in confluence


### Files

- `Dockerfile`: the structure of the custom Docker container, linked to the rest and soap data as well as application.yml
- `application.yml`: the necessary configuration for the app

### Docker base image

Note, the default base image that is used, `vlaamseoverheid-magda-docker-releases.jfrog.io/magda/magda.magdamock` (set by the `CONTAINER_NAME` argument in the Dockerfile), is not publicly available.
To use a different base image (e.g. `ghcr.io/informatievlaanderen/magda-mock-v2`) you have to use the following build command:

```bash
docker build --build-arg CONTAINER_NAME="ghcr.io/informatievlaanderen/magda-mock-v2" -t custom-magdamock-community:latest
```

