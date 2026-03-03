resource "aws_route53_record" "roboshop" {
#   count = 10
  for_each = var.instances
  zone_id = var.zone_id
#  name    = var.instances[count.index] == "frontend" ? "${var.domain_name}" : "${var.instances[count.index]}.${var.domain_name}" #mongodb.someshwar.fun
  name = each.key == "frontend" ? "${var.domain_name}" : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
#   records =  var.instances[count.index] == "frontend" ? [aws_instance.this[count.index].public_ip] : [aws_instance.this[count.index].private_ip]
  records = each.key == "frontend" ? "${var.domain_name}" : "${each.key}.${var.domain_name}"
  allow_overwrite = true
}

