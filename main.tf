terraform {
  required_providers {
    docker = {
      source = "terraform-provider-docker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "my-nginx-container"
  image = docker_image.nginx_image.image_id
  ports {
    internal = 80
    external = 8080
  }
}
