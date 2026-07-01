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
