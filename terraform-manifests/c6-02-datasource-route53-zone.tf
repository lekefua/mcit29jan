# Get DNS information from AWS Route53
/*data "aws_route53_zone" "mydomain" {
  name         = "devopsincloud.com"
}*/
resource "aws_route53_record" "mcittest" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.mcitdevops.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}
# Output MyDomain Zone ID
output "mydomain_zoneid" {
  description = "The Hosted Zone id of the desired Hosted Zone"
  value = data.aws_route53_zone.mydomain.zone_id 
}

# Output MyDomain name
output "mydomain_name" {
  description = " The Hosted Zone name of the desired Hosted Zone."
  value = data.aws_route53_zone.mydomain.name
}
