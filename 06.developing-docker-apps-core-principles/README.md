# Developing Docker Apps: Core Principles

Overview

- Working with Docker images
- Optimizing Docker images
- Consuming configuration from the environment
- Debugging containerized applications

## 1. Using Volumes to Develop Applications in Containers

Module outline

- The inner loop of software development with container
- Data persistence with Docker Volumes
- Hot reloads on source file changes
- How to handle volumes permissions
- Developing with bind mount volumes

```Dockerfile
FROM node:14

# Create app directory
WORKDIR /app

# Copy app source from build context
COPY . .

# Install app dependencies
RUN npm install

# Port app listens on
EXPOSE 3000

# Specify container's default command
CMD ["node", "src/index.js"]
```

![Build Process](buildprocess.png)

An image is a template for containers

### 1.1. The inner loop of code development

![The inner loop](theinnerloop.png)

![The inner loop with container](theinnerloopwithcontainer.png)

Container Image Builds

> Complex image definitions can take a significant amount of time to build.
> This can severely impact the productivity of a software developer.

So, we decide to develop inside the containers

![Develop inside the container](developinsidecontainer.png)

We need a method for persisting changes between container invocations. This will
allow us to develop inside a container without losing our changes.

### 1.2. Docker Volumes

![Docker Volumes Overview](dockervolumesoverview.png)

Volume Types

- tmpfs mount; used to store sensitive data
  Temporary storage: data stored in memory
- Named or anonymous volume; manage by Docker
  Volumes managed by Docker: managed using Docker Cli
- Bind mount: arbitrary directory mounted from host
  Mounts a specific directory: changes reflected on host

Creating a Named Volume

- `docker volume create code-volume`
- `docker run --volume code-volume:/app ...`

|                                   Advantages | Disadvantages          |
| -------------------------------------------: | :--------------------- |
|                   Volume is a managed object | Owned by the root user |
|            Isolated from other host activity |                        |
|                  Easy to identify and backup |                        |
| Better performance when using Docker Desktop |                        |

You must run your container as the root user in order to write to the volume
and running your container as the root user is not recommended for security reasons
and it should be avoided if at all possible.

Using Bind mounts instead

- Host location mounted into the container when the container is invoked.
- Directory paths must be absolute paths rather than relative paths

`docker run --volume /path/on/host:/path/in/container ...`

Build images

`docker build -t myapp:1.0 .`

Handling Dynamic Changes

- Watch for changes: Edits to source code are automatically detected inside running container
- Perform hot reload: Process monitor performs a hot reload by restarting the application in the container

Coding inside a Container

- Mount host directory with source code into container
- Replace default command with hot reload utility (e.g. `nodemon`)

`docker run -itd -p 3000:3000 --volume $(pwd):/app myapp:1.0 nodemon src/index.js`

Outcomes

- Changes made to source code located on the host are reflected in the container via the bind mount volume
- The hot reload utility automatically detects any changes to the source files and restarts the server
- The changes can be tested to check they have implemented the desired behavior
