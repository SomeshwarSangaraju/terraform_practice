variable "domain_name"{
    default="someshwar.fun"
}

variable "zone_id"{
    default="Z01510281GETZQBO4NWF0"
}

variable "instances"{
    default=["mongodb", "redis", "rabbitmq", "mysql", "catalogue","user","cart","shipping", "payment", "frontend" ]
}