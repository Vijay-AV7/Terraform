# Creating Security Group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = var.cidr_range
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = var.cidr_range
  }

  tags = {
    Name = "allow_tls"
  }
}

# Creating Ec2 Instance
# resource "aws_instance" "instance" { # here aws_instance is resource type (predefined) cannot change. "instance" is resource name and its used to refer the resoruce 
#   ami           = "ami-0220d79f3f480ecf5"
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.allow_tls

#   tags = {
#     Name = "terraform" #This is our instance name
#     Purpose = "terraform-practice"
#   }
# }