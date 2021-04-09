// for more information about packer initialization, see
// https://www.packer.io/docs/commands/init

packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}
