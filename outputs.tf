# todo: output the instance's public ip address
# the output must be named "public_ip"

output "public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}