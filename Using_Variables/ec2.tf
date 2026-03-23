# Creating Security Group
#Since we have provided region in provider file terraform will pick that
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls" #Security group name
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1" #-1 means all if -1 is used then from and to ports should be 0
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tag" # Name (refer security group for better understanding)
  }
}

# to see the values in above resource output give type.name (eg:- aws_security_group.allow_tls) in output and you can take id or name any parameter

    # output "security_group_info" {
    #   value = aws_security_group.allow_tls.id 
    # }

# Creating Ec2 Instance
resource "aws_instance" "instance" { # here aws_instance is resource type (predefined) cannot change. "instance" is resource name and its used to refer the resoruce 
  ami           = var.ami_id # This is devops-practice AMI ID
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform" #This is our instance name
    Purpose = "terraform-practice"
  }
}