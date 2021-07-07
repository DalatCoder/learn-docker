# Docker For Web Developers

## 1. Why use docker as a Developer?

### 1.1. What is Docker?

- Lightweight, open, secure platform
- Simplify building, shipping, running apps
- Shipping container system for code
- Runs natively on Linux or Windows Server
- Runs on Windows or Mac development machines (with a virtual machine)
- Relies on 'images' and 'containers'

### 1.2. The role of Images and Containers

An image is something that's used to build a container. An image will have the necessary files
to run something on an operating system like Ubuntu or Windows. Think of an image as the
blueprint that's used to actually get a running container going.

Containers are actually where the live application runs, or the database or caching server
or whatever it may be that you need to actually run on a Linux or a Windows Server machine.

Image

> A read-only template composed of layered filesystems used to share common files
> and create Docker container instances.

Container

> An isolated and secured shipping container created from an image that can be run,
> started, stopped, moved and deleted.

In a nutshell, an image is used to create an instance of the running container.

![Docker vs VM](dockervsvmw.png)

### 1.3. Docker Benefits (for Web Developers)

- Accelerate Developer Onboarding
- Eliminate App Conflicts
- Environment Consistency
- Ship Software Faster

## 2. Using Docker Tools
