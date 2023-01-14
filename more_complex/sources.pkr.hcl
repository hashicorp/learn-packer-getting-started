// These builder sources will be used in build.pkr.hcl

source "docker" "example" {
  image  = "ubuntu:xenial"
  commit = true
}

source "docker" "example-2" {
  image  = "ubuntu:bionic"
  commit = true
}

// Null builders create no resources and store no artifacts. They are useful for
// debugging build flow, but are very limited in terms of practical use and
// don't work with most provisioners since there isn't anyting created for them
// to provision
source "null" "example-3" {
  communicator = "none"
}
