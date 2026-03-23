# aws_instance.instance ->  gives the instance info and we are refering public an private IP 

resource "aws_route53_record" "heineken" {
  count = length(var.instance_name)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}" #Interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.instance[count.index].private_ip] #We have to include private/public IP here
  allow_overwrite = true
}

resource "aws_route53_record" "heineken_public" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records  = [aws_instance.instance[2].public_ip] #We have to include private/public IP here
  allow_overwrite = true
}