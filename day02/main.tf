terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  
}

resource "docker_image" "nginx-salman" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
    image = docker_image.nginx-salman.image_id
    name = "nginx-container-salman"
    ports {
      internal = 80
      external = 8000
    }
  
}