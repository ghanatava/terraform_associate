provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "tfinstance" {
  ami           =  var.aws_ami
  instance_type = var.aws_instance_type
  key_name      = var.aws_key
  count         = 2


}


