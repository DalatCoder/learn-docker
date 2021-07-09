# Building and Orchestrating Containers with Docker Compose

Overview

- Why use Docker Compose
- YAML fundamentals
- Build one or more images
- Ports, volumes, variables and networks
- Container orchestration
- Additional features

## 1. Getting started with Docker Compose

### 1.1. The role of Docker Compose

![Docker Compose](assets/whyneeddocker.png)

![Docker Compose Feature](assets/dockercomposefeature.png)

![Docker Compose Workflow](assets/workflow.png)

### 1.2. YAML

- YAML files are composed of maps and lists
- Indentation matters (be consistent!)
- Always use spaces
- Maps:
  - name: value pairs
  - Maps can contain other maps for more complex data structures
- Lists:
  - Sequence of items
  - Multiple maps can be defined in a list

![YAML](assets/yaml.png)

### 1.3. Create a Docker Compose File

`docker-compose.yml`

```yml
version: '3.x'

services:

networks:
```

## 2. Building Images with Docker Compose

Key Docker Compose Build Properties

- `context`
- `dockerfile`: name of the dockerfile
- `args`: build arguments
- `image`: name of the built image

```yml
services:
  node:
    image: nodeapp
    build:
      context: .
      dockerfile: node.dockerfile
      args:
        buildversion: 1
    ports:
      - '3000:3000'
```

Define `ARGS` in `Dockerfile` and fill `args` in build process

Run:

- `docker-compose build`
- `docker compose build`

## 3. Orchestrating Containers with Docker Compose

### 3.1. Docker compose properties

- `ports`
- `volumes`
- `environment`
- `networks`

### 3.2. Define ports and volumes

```yml
ports:
  - '8000:3000'
```

Volume Usage Scenarios

- Store log files outside of container
- Store database files outside of container
- Link source code to container (hook source code into container)

### 3.3. Define environment variables

```yml
environment:
  - NODE_ENV=production
  - APP_VERSION=1.0
```

or using file

```yml
env_file:
  - ./common.env
  - settings.env
```

### 3.4. Create a bridge network

![Bridge Network](bridgenetwork.png)

`docker network create --driver bridge isolated_network`

```yml
services:
  web:
    networks:
      - isolated_network:

networks:
  isolated_network:
    driver: bridge
```

### 3.5. Start and Stop Containers

- `docker compose p -d`: detached mode

```yml
services:
  node:
    image: nodeapp

    build:
      context: .
      dockerfile: node.dockerfile

    ports:
      - '3000:3000'

    volumes:
      - ./logs:/var/www/logs

    depends_on:
      - mongodb
```

Node service will be started after any other services it depends on. In above figrue,
`node` service depends on another service named `mongodb` so start the
other service first.

Note: `mongodb` service start first and `node` service start right after it. So,
we still have some try/catch to connect to database

`docker compose up -d --no-deps nodeapp`

Stop, destroy and recreate only `nodeapp` service. Do not recreate services
that `nodeapp` depends on.

- `docker compose ps`
- `docker compose stop`
- `docker compose start`
- `docker compose rm`
