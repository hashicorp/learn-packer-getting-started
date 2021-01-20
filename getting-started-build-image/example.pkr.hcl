# The easiest way to access AWS credentials is to use the appropriately
# named variables. See the [docs](https://www.packer.io/docs/builders/amazon#environment-variables)
# for the exact names to use.
#
# If you don't set a default, then you will need to provide the variable
# at run time using the command line. For more information about the various
# options for setting variables, see the template
# [reference documentation](https://www.packer.io/docs/templates)
#
# variable "aws_access_key" {
#   type    = string
#   default = "your value here"
# }

# variable "aws_secret_key" {
#   type    = string
#   default = "your value here"
# }

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# source blocks configure your builder plugins; your source is then used inside
# build blocks to create resources. A build block runs provisioners and
# post-processors on an instance created by the source.
source "amazon-ebs" "example" {
  # access_key    = "${var.aws_access_key}"
  ami_name      = "packer-example ${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  # secret_key    = "${var.aws_secret_key}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.example"]

}


