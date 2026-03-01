---
title: "Docker Basics: Getting Started with Containerization"
date: 2024-02-25
draft: false
description: "An introduction to Docker and containerization for beginners"
tags: ["docker", "containers", "devops"]
categories: ["DevOps"]
---

## Introduction

Docker has become the industry standard for containerization. In this post, I'll cover the basics of Docker and how to get started with containers.

## What is Docker?

Docker is a containerization platform that packages your application and all its dependencies into a standardized unit called a container. This ensures your application runs the same way regardless of where the container is deployed.

### Key Benefits

- **Consistency**: Run anywhere, anytime with the same behavior
- **Isolation**: Containers are isolated from each other
- **Efficiency**: Lightweight compared to virtual machines
- **Scalability**: Easy to scale applications horizontally

## Getting Started

### Installation

First, install Docker from the [official website](https://www.docker.com/products/docker-desktop).

### Your First Container

Let's run a simple container:

```bash
docker run hello-world
```

This command:
1. Pulls the `hello-world` image from Docker Hub
2. Creates a new container from that image
3. Runs the container
4. Exits

### Understanding Images and Containers

- **Image**: A template or blueprint (like a class in OOP)
- **Container**: A running instance of an image (like an object)

## Creating Your Own Image

### Dockerfile

A `Dockerfile` is a text file that contains instructions to build an image.

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

Key instructions:
- `FROM`: Base image to build upon
- `WORKDIR`: Working directory inside the container
- `COPY`: Copy files from host to container
- `RUN`: Execute commands during build
- `CMD`: Default command to run

### Building the Image

```bash
docker build -t my-app:1.0 .
```

### Running Your Container

```bash
docker run -p 8000:8000 my-app:1.0
```

The `-p` flag maps ports between host and container.

## Docker Compose

For multi-container applications, use Docker Compose:

```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "8000:8000"
    environment:
      - DEBUG=true

  database:
    image: postgres:15
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_PASSWORD=secret
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

Start all services:

```bash
docker-compose up -d
```

## Best Practices

1. **Keep images small**: Use slim or alpine base images
2. **Use .dockerignore**: Exclude unnecessary files
3. **Security**: Don't run as root, use specific versions
4. **Health checks**: Include health check instructions
5. **Logging**: Send logs to stdout/stderr

## Common Commands

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# View logs
docker logs <container-id>

# Execute command in container
docker exec -it <container-id> bash

# Remove container
docker rm <container-id>

# Remove image
docker rmi <image-id>
```

## Next Steps

- Explore Docker Hub for pre-built images
- Learn about Docker networking and storage
- Practice with docker-compose for multi-container setups
- Explore container orchestration with Kubernetes

## Conclusion

Docker has revolutionized how we develop and deploy applications. Start with these basics and gradually explore more advanced features as you become comfortable with containers.

Happy containerizing!
