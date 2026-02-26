variable "ec2_region" {
  type        = string
  default     = "us-east-1"
  description = "The region where the resouces will be deployed"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Type of the instance to be created"
}

variable "instance_name" {
  type        = string
  default     = "skynet-ec"
  description = "The name of the instance to be created"

}

variable "department" {
  default = "Finance"
  type    = string

}

variable "instance_count" {
  type    = number
  default = 2

}