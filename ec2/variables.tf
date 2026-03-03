variable "domain_name"{
    default="someshwar.fun"
}

variable "zone_id"{
    default="Z01510281GETZQBO4NWF0"
}

variable "instances"{
    # default=["mongodb", "redis", "rabbitmq", "mysql", "catalogue","user","cart","shipping", "payment", "frontend" ]

    default = {
        mongodb = {
            instance_type="t3.micro"
        }
        redis = {
            instance_type="t3.micro"
        }
        rabbitmq = {
            instance_type="t3.micro"
        }
        mysql = {
            instance_type="t3.micro"
        }
        catalogue = {
            instance_type="t3.micro"
        }
        user = {
            instance_type="t3.micro"
        }
        cart = {
            instance_type="t3.micro"
        }
        shipping = {
            instance_type="t3.micro"
        }
        payment = {
            instance_type="t3.micro"
        }
        frontend = {
            instance_type="t3.micro"
        }

    }
}