packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "example" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  sources = [
    "source.docker.example",
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "swampdragons/testpush"
      tags       = ["vanilla-icecream", "tag2"]
    }
    post-processor "docker-push" {}
  }

  post-processors {
    post-processor "vagrant" {}
    post-processor "vagrant-cloud" {
      access_token = var.vagrant_token
      version      = "0.2"
      box_tag      = "myuser/packerbox"
    }
  }
}