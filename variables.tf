variable "aws_vpc_id" {
description = "exist EPAM VPC"
type = string
default = "vpc-6c6dfe06"
}

variable "subnet_ids" {
description = "Exist EPAM VPC subnet IDs"
default =["subnet-18068254", "subnet-dc4a30b6", "subnet-2965d455"]
}

variable "sg_id" {
description = "exist EPAM SG"
type = string
default = "sg-0a8b5db2a7dcca42a"
}

variable db_pass {
default = "testbvhfdjr423g67fdsa!32"
}
variable db_user {
default = "test"
}
