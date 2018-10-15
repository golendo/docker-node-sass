# docker-node-sass
docker image which installs node-sass to extract the binary in environments behind firewalls.


#### Usage:
```dockerfile
FROM golendo/docker-node-sass as sass-source

FROM node:latest as frontend

RUN useradd -ms /bin/bash frontend-user
USER frontend-user

RUN mkdir -p /home/frontend-user/sass-binding/
COPY --from=sass-source /sass/binding.node /home/frontend-user/sass-binding/binding.node
ENV SASS_BINARY_PATH /home/frontend-user/sass-binding/binding.node

# create folder for the app
RUN mkdir -p /home/frontend-user/app/
WORKDIR /home/frontend-user/app/

## add your package.json

RUN npm install

## add your project sources
```
