variable "cidr_block" {
  default = {
    spoke-vpc-01 = {
      cidr = "10.100.0.0/16"
      tag  = "spoke-vpc-01"
    }
    spoke-vpc-02 = {
      cidr = "10.99.0.0/16"
      tag  = "spoke-vpc-02"
    }
    egress-vpc = {
      cidr = "10.200.0.0/16"
      tag  = "egress-vpc"
    }
    inspection-vpc = {
      cidr = "10.22.0.0/16"
      tag  = "inspection-vpc"
    }
  }
}

variable "inspection-vpc-cidr" {
  default = "10.22.0.0/16"
}

variable "spoke-vpc-01-cidr" {
  default = "10.100.0.0/16"
}

variable "egress-vpc-cidr" {
  default = "10.200.0.0/16"
}

variable "spoke-vpc-02-cidr" {
  default = "10.99.0.0/16"
}

variable "inspection-subnets" {
  default = {
    inspection-fw-az-a-ep = {
      cidr = "10.22.0.0/28"
      az   = "us-west-1b"
      tag  = "inspection-fw-az-a-ep"
    }
    inspection-fw-az-b-ep = {
      cidr = "10.22.0.16/28"
      az   = "us-west-1c"
      tag  = "inspection-fw-az-a-ep"
    }
    inspection-tgw-az-a-ep = {
      cidr = "10.22.0.32/28"
      az   = "us-west-1b"
      tag  = "inspection-fw-az-a-ep"
    }
    inspection-tgw-az-b-ep = {
      cidr = "10.22.0.48/28"
      az   = "us-west-1c"
      tag  = "inspection-fw-az-a-ep"
    }
  }
}

variable "firewall_subnets" {
  default = {
    inspection-fw-az-a-ep = {
      sub = "10.22.0.0/28"
      az   = "us-west-1b"
      tag  = "inspection-fw-az-a-ep"
    }
    inspection-fw-az-b-ep = {
      sub = "10.22.0.16/28"
      az   = "us-west-1c"
      tag  = "inspection-fw-az-a-ep"
    }
 }
}

variable "egress-subnets" {
  default = {
    egress-public-az-a-ep = {
      cidr = "10.200.1.0/24"
      az   = "us-west-1b"
      tag  = "egress-public-az-a-ep"
    }
    egress-public-az-b-ep = {
      cidr = "10.200.2.0/24"
      az   = "us-west-1c"
      tag  = "egress-public-az-a-ep"
    }
    egress-tgw-az-a-ep = {
      cidr = "10.200.0.0/28"
      az   = "us-west-1b"
      tag  = "egress-public-az-a-ep"
    }
    egress-tgw-az-b-ep = {
      cidr = "10.200.0.16/28"
      az   = "us-west-1c"
      tag  = "egress-public-az-a-ep"
    }
  }
}

variable "spoke-vpc-01-subnets" {
  default = {
    spoke-vpc-01-workload-subnet = {
      cidr = "10.100.1.0/24"
      az   = "us-west-1b"
      tag  = "spoke-vpc-01-workload-subnet"
    }
    spoke-vpc-01-tgw-az-a-ep = {
      cidr = "10.100.0.0/28"
      az   = "us-west-1c"
      tag  = "spoke-vpc-01-tgw-az-a-ep"
    }
  }
}

variable "spoke-vpc-02-subnets" {
  default = {
    spoke-vpc-02-workload-subnet = {
      cidr = "10.99.1.0/24"
      az   = "us-west-1b"
      tag  = "spoke-vpc-01-workload-subnet"
    }
    spoke-vpc-02-tgw-az-a-ep = {
      cidr = "10.99.0.0/28"
      az   = "us-west-1c"
      tag  = "spoke-vpc-02-tgw-az-a-ep"
    }
  }
}



