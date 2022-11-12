network_name = "nyoung-vpc"
subnets = [
  {
    subnet_name = "nyoung-subnet-iowa"
    subnet_ip = "10.10.0.0/24"
    subnet_region = "us-central1"
  },
  {
    subnet_name = "nyoung-subnet-seoul"
    subnet_ip = "10.20.0.0/24"
    subnet_region = "asia-northeast3"
  }
]

rules = [
  {
    name = "allow-ssh-ingress"
    direction = "INGRESS"
    ranges = ["0.0.0.0/0"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports = ["22"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name = "allow-rdp-ingress"
    direction = "INGRESS"
    ranges = ["0.0.0.0/0"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports = ["3389"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
#  {
#    name = "allow-icmp-ingress"
#    direction = "INGRESS"
#    ranges = ["0.0.0.0/0"]
#    priority = 1000
#    source_tags             = null
#    source_service_accounts = null
#    target_tags             = null
#    target_service_accounts = null
#    allow = [{
#      protocol = "icmp"
#      ports = [""]
#    }]
#    deny = []
#    description             = null
#    log_config = {
#      metadata = "INCLUDE_ALL_METADATA"
#    }
#  },
  {
    name = "allow-internal-ingress"
    direction = "INGRESS"
    ranges = ["10.10.0.0/24","10.20.0.0/24"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "TCP"
      ports = ["0-65535"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name = "allow-http-ingress"
    direction = "INGRESS"
    ranges = ["0.0.0.0/0"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_service_accounts = null
    target_tags = ["http-server"]
    allow = [{
      protocol = "tcp"
      ports = ["80"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name = "allow-https-ingress"
    direction = "INGRESS"
    ranges = ["0.0.0.0/0"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_service_accounts = null
    target_tags = ["https-server"]
    allow = [{
      protocol = "tcp"
      ports = ["443"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    name = "allow-hc-ingress"
    direction = "INGRESS"
    ranges = ["35.191.0.0/16","30.211.0.0/22"]
    priority = 1000
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports = ["0-65535"]
    }]
    deny = []
    description             = null
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
]
