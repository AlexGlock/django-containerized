# automated django deployment #

This Repo contains a setup with ``Dockerfile`` and ``docker-compose.yml`` which should allow a containerized auto-deploy for the Django App.
This setup can be run with Docker or Podman (no comercial license-limitation).

## The podman setup ##

Your system needs

    sudo apt-get install podman
    sudo apt install podman-compose
    # if apt is not working build it with python/pip3
    sudo pip3 install podman-compose

Autodeploy the dev-server in the project directory using Podman

    podman-compose up --build

Autodeploy the dev-server using Docker (if installed)

    docker compose up --build

The first invocation will take a while because the image needs to be build from scratch.
