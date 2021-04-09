// Here we're loading sources defined in sources.pkr.hcl

build {
  sources = [
    "source.docker.example-2",
    "source.docker.example",
    "source.null.example-3",
  ]
  provisioner "shell" {
    // the shell provisioner wouldn't work with the null builder, so we skip it
    // using this except field
    except = ["null.example-3"]
    environment_vars = [
      "FLAVOR=${var.flavor}",
    ]
    inline = [
      "echo \"My favorite ice cream is $FLAVOR\"",
    ]
  }
  provisioner "shell-local" {
    inline = ["echo welcome to Packer!"]
  }
}