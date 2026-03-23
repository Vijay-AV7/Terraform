# We use the data to get the values in runtime
data "aws_ami" "RHEL" {
    most_recent      = true
    owners           = ["973714476881"]
    
    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
  default = true
}

output  "ami_id" {
  value       = data.aws_ami.RHEL.id
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}