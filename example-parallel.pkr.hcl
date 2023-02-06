# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

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

source "docker" "example-bionic" {
  image  = "ubuntu:bionic"
  commit = true
}

build {
  sources = [
    "source.docker.example-bionic",
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
}