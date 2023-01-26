
resource "aws_s3_bucket" "terraform-source-backend" {
    bucket = "${var.bucket_name}" 
    force_destroy = true
}

resource "aws_security_group" "internalNetwork" {
    description = "Alows SSH access to developer and internal ips"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "177.9.80.184/32",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = true
            to_port          = 65535
        },
    ]
    name        = data.aws_security_group.internalNetwork.name
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-0d9ad994e02958e36"
}

resource "aws_instance" "sv1" {
    ami                                  = "ami-0b5eea76982371e91"
    instance_type                        = "t2.micro"
    key_name                             = "devtnascimento"
    security_groups                      = [
        data.aws_security_group.internalNetwork.name,
    ]
    vpc_security_group_ids               = [
        data.aws_security_group.internalNetwork.id
    ]
}



