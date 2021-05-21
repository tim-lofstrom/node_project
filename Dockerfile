FROM node:14 as build-env

# Build client
WORKDIR /usr/src/build/client
COPY client/package*.json ./
RUN npm install
COPY client .
RUN npm run build

# Build server
WORKDIR /usr/src/build/server
COPY server/package*.json ./
RUN npm install
COPY server .
RUN npm run build

FROM node:14

# Create app dist
WORKDIR /usr/src

# Copy dist
COPY --from=build-env /usr/src/build/dist .

EXPOSE 3000

CMD [ "node", "server.js" ]
