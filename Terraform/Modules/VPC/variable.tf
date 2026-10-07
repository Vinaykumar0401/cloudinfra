variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable public_subnet_cidr_1 {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for the public subnet"
}

variable public_subnet_cidr_2 {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR block for the public subnet"
}

variable private_subnet_app_cidr_1 {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR block for the private app subnet"
}

variable private_subnet_app_cidr_2 {
  type        = string
  default     = "10.0.4.0/24"
  description = "CIDR block for the private app subnet"
}

variable private_subnet_db_cidr_1 {
  type        = string
  default     = "10.0.5.0/24"
  description = "CIDR block for the private database subnet"
}

variable private_subnet_db_cidr_2 {
  type        = string
  default     = "10.0.6.0/24"
  description = "CIDR block for the private database subnet"
}

variable availability_zone_1 {
  type        = string
  default     = "ap-southeast-2a"
  description = "Availability zone for the first set of subnets"
}

variable availability_zone_2 {
  type        = string
  default     = "ap-southeast-2b"
  description = "Availability zone for the second set of subnets"
}
