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
        Project = "terraform"
        Component = "backend"
        Environment = "dev"
        Name = "terraform-backend-dev"
    }
}
