# Getting Started with Docker

## 1. Getting Docker

- Docker Desktop
- Play with Docker

## 2. Deploying a containerized app

Overview

- Warp speed run-through
- More detail look
  - Containerizing an app
  - Hosting on a registry
  - Running a containerizing app
  - Managing a containerizing app

Flow

- Project with source code and dependencies
- Use docker to build an image of this project
- Push the image to Docker hub
- Using docker to run the container

### 2.1. Containerizing an App

Create Dockfile with following information

```Docker
# Test web app that returns the name of the host/pod/container servicing req
# Linux x64
FROM node:current-alpine

LABEL org.opencontainers.image.title="Hello Docker Learners!" \
      org.opencontainers.image.description="Web server showing host that responded" \
      org.opencontainers.image.authors="@nigelpoulton"

# Create directory in container image for app code
RUN mkdir -p /usr/src/app

# Copy app code (.) to /usr/src/app in container image
COPY . /usr/src/app

# Set working directory context
WORKDIR /usr/src/app

# Install dependencies from packages.json
RUN npm install

# Command for container to execute
ENTRYPOINT [ "node", "app.js" ]
```

Containerizing an app with the command

`docker image build -t <dockerid>/<repo_name>:<image_name> <starting_point>`

`docker image build -t dalatcoder/gsd:first-ctr .`

`.` for current directory which contains `Dockerfile` file.

List all docker images with: `docker image ls`

### 2.2. Hosting a Registry

Host the image on DockerHub with the following command:

`docker image push dalatcoder/gsd:first-ctr`

### 2.3. Running a containerized app

Image vs Container

- An image would be like a class (`build time`), images are build time constructs
- Container like an object created from that class (`run time`), container is runtime constructs

Running a container from an image with the command

`docker container run -d --name web -p 8000:8080 dalatcoder/gsd:first-ctr`

- `-d`: dettach, running the container in background, dettach from current terminal
- `--name`: name of the running container, showing when run the command: `docker container ls`
- `-p`: port mapping, map port 8000 on Docker host (Current computer) with port of the app inside the container
  (Express app running on port 8080). Any trafic that hit port 8000 on Dockerhost will be send to port 8080
  on the running container.

### 2.4. Managing a containerized app

Containerized app: An application that runs inside a container

Stop a running container.

- Docker will send the SIGTERM signal to the app (gives the app 10 seconds for shutdown)
- Or SIGKILL (kill the app imediately)

`docker container stop <running_container_name>`

List status

`docker container ls -a`

Start a container

`docker container start web`

Remove a container (stop the running container first)

`docker container rm web`

Run docker container with interactive and terminal with the following command

- `alpine`: Lightweight OS base on Linux
- `sh`: Shell application

`docker container run -it --name test alpine sh`

Exit container: Hit `Ctrl P Q`
