resource "aws_route53_record" "heineken" {
  zone_id = var.zone_id
  name    = "${var.instance_type[count.index]}.${var.domain_name}" #Interpolation
  type    = "A"
  ttl     = 1
  records        = [var.instance_type[count.index].private_ip] #We have to include private/public IP here
}

resource "aws_route53_record" "heineken" {
  zone_id = var.zone_id
  name    = var.domain_name #Interpolation
  type    = "A"
  ttl     = 1
  records        = [var.instance_type[2].public_ip] #We have to include private/public IP here
}