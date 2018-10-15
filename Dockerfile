FROM node:latest as sass-builder

RUN useradd -ms /bin/bash node-user

USER node-user
RUN mkdir -p /home/node-user/sass
WORKDIR /home/node-user/sass

ENV SASS_FORCE_BUILD 1
RUN npm install node-sass
RUN find /home/node-user/sass/node_modules/node-sass/vendor -name binding.node -exec mv {} /home/node-user/sass/binding.node \;


FROM scratch
COPY --from=sass-builder /home/node-user/sass/binding.node /sass/binding.node
