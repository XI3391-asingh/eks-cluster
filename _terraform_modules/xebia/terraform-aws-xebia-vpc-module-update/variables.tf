################################################################################
# PROVIDER CONFIGURATION
################################################################################

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region where resources will be created."
}
variable "assume_role_arn" {
  type        = string
  default     = ""
  description = "The role to be assumed while creating resources."
}
variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to add to resources."
}

################################################################################
# VPC
################################################################################

variable "name" {
  type        = string
  description = "Name of the VPC."
}
variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "secondary_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "list of additional ipv4 cidr blocks to associate with vpc"
}
variable "enable_dns_hostnames" {
  type        = bool
  default     = false
  description = "Should be true to enable DNS hostnames in the VPC."
}
variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Determines whether the VPC supports DNS resolution through the Amazon provided DNS server."
}
variable "enable_ipv6" {
  type        = bool
  default     = false
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC"
}
variable "azs" {
  type        = list(string)
  default     = []
  description = "list of availability zones (names or ids) in the region where subnets are to be created"
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with vpc"
}

################################################################################
# VPC DEFAULT SECURITY GROUP
################################################################################

variable "manage_default_security_group" {
  type        = bool
  default     = false
  description = "whether to manage default security group"
}
variable "default_security_group_name" {
  type        = string
  default     = ""
  description = "name of the default security group"
}
variable "default_security_group_ingress" {
  type        = list(map(string))
  default     = []
  description = "ingress rules for default security group of the vpc"
}
variable "default_security_group_egress" {
  type        = list(map(string))
  default     = []
  description = "egress rules for default security group of the vpc"
}
variable "default_security_group_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with default security group"
}

################################################################################
# INTERNET GATEWAY
################################################################################

variable "create_igw" {
  type        = bool
  default     = false
  description = "whether internet gateway and related routes needs to be created for public subnets"
}
variable "igw_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with internet gateway"
}

################################################################################
# DEFAULT ROUTES
################################################################################

variable "manage_default_route_table" {
  type        = bool
  default     = false
  description = "should be true to manage default route table"
}
variable "default_route_table_propagating_vgws" {
  type        = list(string)
  default     = []
  description = "list of virtual gateways for propagation"
}
variable "default_route_table_routes" {
  type        = list(map(string))
  default     = []
  description = "list of rules to add to default route table"
}
variable "default_route_table_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with default route table"
}

################################################################################
# PUBLIC ROUTE TABLE
################################################################################

variable "public_route_table_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with public route table"
}

################################################################################
# PRIVATE ROUTE TABLE
################################################################################

variable "private_route_table_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with private route table"
}

################################################################################
# DATABASE ROUTES
################################################################################

variable "create_database_subnet_route_table" {
  type        = bool
  default     = false
  description = "whether to create a route table for database subnets"
}
variable "database_route_table_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with database route table"
}
variable "create_database_internet_gateway_route" {
  type        = bool
  default     = false
  description = "whether an internet gateway route should be created for database subnets"
}
variable "create_database_nat_gateway_route" {
  type        = bool
  default     = false
  description = "whether a nat gateway route should be created for database subnets"
}

################################################################################
# PUBLIC SUBNETS
################################################################################

variable "public_subnets" {
  type        = list(string)
  default     = []
  description = "list of public subnets to create inside the VPC"
}
variable "public_subnet_suffix" {
  type        = string
  default     = "public"
  description = "suffix to append to public subnet names"
}
variable "map_public_ip_on_launch" {
  type        = bool
  default     = false
  description = "whether instances launched in the subnets should be assigned a public ip address on launch"
}
variable "public_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address"
}
variable "public_subnet_ipv6_prefixes" {
  type        = list(string)
  default     = []
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256)"
}
variable "public_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with public subnets"
}

################################################################################
# PRIVATE SUBNETS
################################################################################

variable "private_subnets" {
  type        = list(string)
  default     = []
  description = "list of private subnets to create inside the VPC"
}
variable "private_subnet_suffix" {
  type        = string
  default     = "private"
  description = "suffix to append to private subnet names"
}
variable "private_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address"
}
variable "private_subnet_ipv6_prefixes" {
  type        = list(string)
  default     = []
  description = "Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256)"
}
variable "private_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with private subnets"
}

################################################################################
# DATABASE SUBNETS
################################################################################

variable "database_subnets" {
  type        = list(string)
  default     = []
  description = "list of database subnets to create inside the VPC"
}
variable "database_subnet_suffix" {
  type        = string
  default     = "db"
  description = "suffix to append to database subnet names"
}
variable "database_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address"
}
variable "database_subnet_ipv6_prefixes" {
  type        = list(string)
  default     = []
  description = "Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256)"
}
variable "database_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with database subnets"
}
variable "create_database_subnet_group" {
  type        = bool
  default     = false
  description = "whether to create database subnet group"
}
variable "database_subnet_group_name" {
  type        = string
  default     = ""
  description = "name of database subnet group"
}
variable "database_subnet_group_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with database subnet group"
}

################################################################################
# DEFAULT NETWORK ACLs
################################################################################

variable "manage_default_network_acl" {
  type        = bool
  default     = false
  description = "whether to adopt and manage default network ACL"
}
variable "default_network_acl_name" {
  type        = string
  default     = ""
  description = "name to associate with default network ACL"
}
variable "default_network_acl_ingress" {
  type = list(map(string))
  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
  description = "list of ingress rules to set on the default network ACL"
}
variable "default_network_acl_egress" {
  type = list(map(string))
  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
  description = "list of egress rules to set on the default network ACL"
}
variable "default_network_acl_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with default network ACL"
}

################################################################################
# PUBLIC NETWORK ACLs
################################################################################

variable "public_dedicated_network_acl" {
  type        = bool
  default     = false
  description = "whether to use dedicated network ACL (non-default) and custom rules for public subnets"
}
variable "public_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "public subnets inbound network ACL rules"
}
variable "public_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "public subnets outbound network ACL rules"
}
variable "public_acl_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with public network ACL"
}

################################################################################
# PRIVATE NETWORK ACLs
################################################################################

variable "private_dedicated_network_acl" {
  type        = bool
  default     = false
  description = "whether to use dedicated network ACL (non-default) and custom rules for private subnets"
}
variable "private_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "private subnets inbound network ACL rules"
}
variable "private_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "private subnets outbound network ACL rules"
}
variable "private_acl_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with private network ACL"
}

################################################################################
# DATABASE NETWORK ACLs
################################################################################

variable "database_dedicated_network_acl" {
  type        = bool
  default     = false
  description = "whether to use dedicated network ACL (non-default) and custom rules for database subnets"
}
variable "database_inbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "database subnets inbound network ACL rules"
}
variable "database_outbound_acl_rules" {
  type = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
  description = "database subnets outbound network ACL rules"
}
variable "database_acl_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with database network ACL"
}

################################################################################
# NAT GATEWAY
################################################################################

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "whether to create NAT gateway(s)"
}
variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "whether to create a single shared NAT gateway for all private subnets"
}
variable "one_nat_gateway_per_az" {
  type        = bool
  default     = false
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
}
variable "reuse_nat_ips" {
  type        = bool
  default     = false
  description = "whether to use existing EIP(s) for NAT Gateway(s) being created instead of creating new EIP(s)"
}
variable "external_nat_ip_ids" {
  type        = list(string)
  default     = []
  description = "list of EIP ID(s) to be assigned to the NAT Gateway(s)"
}
variable "nat_eip_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with NAT EIP(s)"
}
variable "nat_gateway_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with NAT gateway(s)"
}

################################################################################
# CUSTOMER GATEWAYS
################################################################################

variable "customer_gateways" {
  type        = map(map(any))
  default     = {}
  description = "Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address)"
}
variable "customer_gateway_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with customer gateway"
}

################################################################################
# DEFAULT VPC
################################################################################

variable "manage_default_vpc" {
  type        = bool
  default     = false
  description = "whether to manage default vpc"
}
variable "default_vpc_name" {
  type        = string
  default     = ""
  description = "name to be associated with default vpc"
}

variable "default_vpc_enable_dns_support" {
  type        = bool
  default     = false
  description = "whether to enable dns support in default VPC"
}
variable "default_vpc_enable_dns_hostnames" {
  type        = bool
  default     = false
  description = "whether to enable DNS hostnames in the default VPC"
}
variable "default_vpc_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with default vpc"
}


################################################################################
# FLOW LOGS
################################################################################

variable "enable_flow_log" {
  type        = bool
  default     = true
  description = "whether or not to enable VPC flow logs"
}
variable "flow_log_destination_type" {
  type        = string
  default     = "cloud-watch-logs"
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs"
  validation {
    error_message = "Valid values are s3 and cloud-watch-logs."
    condition     = contains(["s3", "cloud-watch-logs"], var.flow_log_destination_type)
  }
}
variable "flow_log_destination_arn" {
  type        = string
  default     = ""
  description = "the ARN of the cloudwatch log group or s3 bucket where VPC flow logs will be pushed"
}
variable "flow_log_traffic_type" {
  type        = string
  default     = "ALL"
  description = "the type of traffic to capture, valid values are ACCEPT, REJECT, ALL"
  validation {
    error_message = "Valid values are ACCEPT, REJECT, ALL."
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_log_traffic_type)
  }
}
variable "flow_log_max_aggregation_interval" {
  type        = number
  default     = 600
  description = "the max interval of time during which a particular flow is captured and aggregated into a flow record"
  validation {
    error_message = "Valid values are 60, 600."
    condition     = contains([60, 600], var.flow_log_max_aggregation_interval)
  }
}
variable "vpc_flow_log_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with vpc flow logs"
}


################################################################################
# FLOW LOG CLOUDWATCH
################################################################################

variable "create_flow_log_cloudwatch_log_group" {
  type        = bool
  default     = true
  description = "whether to create cloudwatch log group for VPC flow logs"
}
variable "flow_log_cloudwatch_log_group_name_prefix" {
  type        = string
  default     = "/aws/vpc-flow-log/"
  description = "name prefix of cloudwatch log group for VPC flow logs"
}
variable "create_flow_log_cloudwatch_iam_role" {
  type        = bool
  default     = true
  description = "whether to create an IAM role for VPC flow logs"
}
variable "flow_log_cloudwatch_iam_role_arn" {
  type        = string
  default     = ""
  description = "ARN of existing IAM role for VPC flow log cloudwatch log group"
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  type        = number
  default     = null
  description = "no of days log events should be retained"
}
variable "flow_log_cloudwatch_log_group_kms_key_id" {
  type        = string
  default     = null
  description = "ARN of the KMS key to use when encyrpting log data for VPC flow logs"
}

################################################################################
# TGW ATTACHMENTS AND ROUTES
################################################################################

variable "transit_gateway_id" {
  type        = string
  default     = ""
  description = "ID of transit gateway for which attachment is to be created"
}
variable "tgwa_dns_support" {
  type        = string
  default     = "enable"
  description = "Whether DNS support is enabled. Valid values are disable, enable"
  validation {
    error_message = "Valid values are disable, enable."
    condition     = contains(["enable", "disable"], var.tgwa_dns_support)
  }
}
variable "tgwa_ipv6_support" {
  type        = string
  default     = "disable"
  description = "Whether IPv6 support is enabled. Valid values are disable, enable"
  validation {
    error_message = "Valid values are disable, enable."
    condition     = contains(["enable", "disable"], var.tgwa_ipv6_support)
  }
}
variable "tgwa_appliance_mode_support" {
  type        = bool
  default     = false
  description = "Whether Appliance Mode support is enabled. If enabled, a traffic flow between a source and destination uses the same Availability Zone for the VPC attachment for the lifetime of that flow."
}
variable "transit_gateway_default_route_table_association" {
  type        = bool
  default     = false
  description = "whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table"
}
variable "transit_gateway_default_route_table_propagation" {
  type        = bool
  default     = false
  description = "whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table"
}
variable "tgwa_tags" {
  type        = map(string)
  default     = {}
  description = "additional tags to associate with tgwa"
}
variable "tgw_route_destination_cidr_block" {
  type        = list(string)
  default     = []
  description = "The destination CIDR bocks for private/public route table tgw routes"
}
variable "create_public_route" {
  type        = bool
  default     = false
  description = "whether to create public routes in public route table "
}

################################################################################
# ENDPOINT(S)
################################################################################

variable "create_endpoints" {
  type        = bool
  default     = false
  description = "whether to create vpc endpoints"
}
variable "endpoints" {
  type        = map(any)
  default     = {}
  description = "A map of endpoint configurations"
}
variable "create_endpoint_sg" {
  type        = bool
  default     = false
  description = "whether to create security group for endpoints"
}
variable "vpc_endpoints_sg_name" {
  type        = string
  default     = ""
  description = "name for the sg for endpoints"
}
variable "vpc_endpoints_sg_rules" {
  type        = list(any)
  default     = []
  description = "list of rules to add to endpoints sg"
}