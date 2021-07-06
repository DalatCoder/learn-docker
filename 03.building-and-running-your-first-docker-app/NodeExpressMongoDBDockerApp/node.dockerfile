FROM        node:15.9.0-alpine 

LABEL       author="Trong Hieu"

ENV         NODE_ENV=production
ENV         PORT=8000

WORKDIR     /var/www
COPY        package.json package-lock.json ./
RUN         npm install

COPY        . ./

EXPOSE      $PORT

ENTRYPOINT [ "npm", "start" ]
