terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  # Docker provider configuration (if needed)
}

resource "docker_network" "my_network" {
  name = "my_network"
}

resource "docker_container" "nginx" {
  name  = "nginx-container"
  image = "nginx:latest"
  networks_advanced {
    name = docker_network.my_network.name
  }
  ports {
    internal = 80
    external = 8080
  }
}
