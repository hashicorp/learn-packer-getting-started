build {
  sources = [
    "source.docker.example"
  ]
  provisioner "shell" {
    inline = ["echo this provisioner runs first"]
  }
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }
}