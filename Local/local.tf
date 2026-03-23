locals {
  ami_id = data.aws_ami.RHEL.id
  instance_type = var.environment == "dev" ? "t3.micro" : "t2.micro"
  security_grp_id = [aws_security_group.allow_tls.id]
}