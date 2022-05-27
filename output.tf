output "PUBLIC_IP" {
  value = aws_instance.employeePortal.public_ip

}
output "END_POINT" {
    value = aws_db_instance.employeeportaldatabase.endpoint
  
}