variable "aws_ami" {
    description = "amazon image id"
    type = string
    default = "ami-0c7090bd76537f73d"
}

variable "aws_instance_type" {
    description = "ec2 instance type"
    type = string
    default = "t2.micro"
}

variable "aws_key" {
    description = "aws key pair name"
    type = string
    default = "ghanatava"
}