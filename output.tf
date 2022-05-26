output "REACT_APP_BASE_URL" {
  value = aws_instance.employeePortal.public_ip

}
output "ENDPOINT" {
    value = aws_db_instance.employeeportaldatabase.endpoint
  
}