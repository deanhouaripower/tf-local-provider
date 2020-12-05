resource "aws_instance" "testVM" {
  ami = data.aws_ami.amazon-linux2.image_id
  instance_type = "t2.large"

  provisioner "local-exec" {
     command = "echo ${self.id} >> myvmid"
  }
}

data "aws_ami" "amazon-linux2"{
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.20200722.0-x86*"]
  }
}