/* 
1. command line --> -var "<var-name>=<var-value>"
2. tfvars
3. env var
4. default values
5. user prompt */

variable "ami_id" {
 type = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
 type = string
  default = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {
        Project = "terraform" # Can be seen in Instance tag
        Component = "backend" # Can be seen in Instance tag
        Environment = "dev" # Can be seen in Instance tag
        Name = "terraform-backend-dev" # Name of the instance and  Can be seen in Instance tag
    }
}