# count based loop
#  resource "aws_route53_record" "roboshop" {
#   count = 10
#   zone_id = var.zone_id
#   name    = var.instances[count.index] == "frontend" ? "${var.domain_name}" : "${var.instances[count.index]}.${var.domain_name}" #mongodb.someshwar.fun
#   type    = "A"
#   ttl     = 1
#   records =  var.instances[count.index] == "frontend" ? [aws_instance.this[count.index].public_ip] : [aws_instance.this[count.index].private_ip]
#   allow_overwrite = true
# }


# for each loop
resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.this
  zone_id = var.zone_id
  name    = "${each.key}" == "frontend" ?"${var.domain_name}" : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = "${each.key}" == "frontend" ? [each.value.public_ip] :  [each.value.private_ip]
  allow_overwrite = true
}
