output "private_ip" {
  value = aws_instance.db_server.private_ip
}

output "public_ip" {
  value = aws_instance.db_server.public_ip
}
