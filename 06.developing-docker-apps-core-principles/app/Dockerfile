FROM node

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

ENTRYPOINT [ "npm", "run" ]

# run custom command: docker run ... dev => npm run dev
# default command: npm run prod
CMD [ "prod" ]
