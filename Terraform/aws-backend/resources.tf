
resource "aws_s3_bucket" "terraform-source-backend" {
    bucket = "${var.bucket_name}" 
    force_destroy = true
}

resource "aws_instance" "sv1" {
    ami                                  = "ami-0b5eea76982371e91"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1e"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t2.micro"
    key_name                             = "devtnascimento"
    monitoring                           = false
    placement_partition_number           = 0
    private_ip                           = "172.31.52.133"
    secondary_private_ips                = []
    security_groups                      = [
        "internalNetwork",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-016059eb3ef5f181c"
    tags                                 = {
        "name" = "sv1"
    }
    tags_all                             = {}
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-03611d112373815fc",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_size           = 8
        volume_type           = "gp2"
    }

    timeouts {}
}



