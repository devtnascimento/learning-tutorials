
data "aws_security_group" "internalNetwork" {
  id = var.sg_id
  name = "internalNetwork"
}


