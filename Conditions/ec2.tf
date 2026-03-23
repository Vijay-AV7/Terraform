

# Creating Ec2 Instance
resource "aws_instance" "instance" { # here aws_instance is resource type (predefined) cannot change. "instance" is resource name and its used to refer the resoruce 
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform" #This is our instance name
    Purpose = "terraform-practice"
  }
}