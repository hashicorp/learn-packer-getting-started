packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

variable "ice_cream" {
  type    = string
  default = "vanilla"
}

variable "docker_image" {
  type    = string
  default = "ubuntu:xenial"
}

source "docker" "example" {
  image  = var.docker_image
  commit = true
}

build {
  sources = [
    "source.docker.example"
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
      "echo ${var.ice_cream}"
    ]
  }
}