output "vpc_id" {
  value = aws_vpc.prod-e-cart.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.prod-e-cart-public-1.id,
    aws_subnet.prod-e-cart-public-2.id,
  ]
}

output "private_app_subnet_ids" {
  value = [
    aws_subnet.prod-e-cart-private-subnet-app-1.id,
    aws_subnet.prod-e-cart-private-subnet-app-2.id,
  ]
}

output "private_db_subnet_ids" {
  value = [
    aws_subnet.prod-e-cart-private-subnet-db-1.id,
    aws_subnet.prod-e-cart-private-subnet-db-2.id,
  ]
}