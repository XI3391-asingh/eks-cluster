module "vpc" {
    source = "../../../../_terraform_modules/xebia/terraform-aws-xebia-vpc-module-update"
    region = var.region
    assume_role_arn = var.assume_role_arn
    extra_tags = var.extra_tags

    name = var.name
    cidr = var.cidr
    secondary_cidr_blocks = var.secondary_cidr_blocks
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    enable_ipv6 = var.enable_ipv6
    azs = var.azs
    tags = var.tags

    manage_default_security_group = var.manage_default_security_group
    default_security_group_name = var.default_security_group_name
    default_security_group_ingress = var.default_security_group_ingress
    default_security_group_egress = var.default_security_group_egress
    default_security_group_tags = var.default_security_group_tags

    create_igw = var.create_igw
    igw_tags = var.igw_tags

    manage_default_route_table = var.manage_default_route_table
    default_route_table_propagating_vgws = var.default_route_table_propagating_vgws
    default_route_table_routes = var.default_route_table_routes
    default_route_table_tags = var.default_route_table_tags

    public_route_table_tags = var.public_route_table_tags

    private_route_table_tags = var.private_route_table_tags

    create_database_subnet_route_table = var.create_database_subnet_route_table
    database_route_table_tags = var.database_route_table_tags
    create_database_internet_gateway_route = var.create_database_internet_gateway_route
    create_database_nat_gateway_route = var.create_database_nat_gateway_route
    
    public_subnets = var.public_subnets
    public_subnet_suffix = var.public_subnet_suffix
    map_public_ip_on_launch = var.map_public_ip_on_launch
    public_subnet_assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
    public_subnet_ipv6_prefixes = var.public_subnet_ipv6_prefixes
    public_subnet_tags = var.public_subnet_tags

    private_subnets = var.private_subnets
    private_subnet_suffix = var.private_subnet_suffix
    private_subnet_assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation
    private_subnet_ipv6_prefixes = var.private_subnet_ipv6_prefixes
    private_subnet_tags = var.private_subnet_tags

    database_subnets = var.database_subnets
    database_subnet_suffix = var.database_subnet_suffix
    database_subnet_assign_ipv6_address_on_creation = var.database_subnet_assign_ipv6_address_on_creation
    database_subnet_ipv6_prefixes = var.database_subnet_ipv6_prefixes
    database_subnet_tags = var.database_subnet_tags
    create_database_subnet_group = var.create_database_subnet_group
    database_subnet_group_name = var.database_subnet_group_name
    database_subnet_group_tags = var.database_subnet_group_tags

    manage_default_network_acl = var.manage_default_network_acl
    default_network_acl_name = var.default_network_acl_name
    default_network_acl_ingress = var.default_network_acl_ingress
    default_network_acl_egress = var.default_network_acl_egress
    default_network_acl_tags = var.default_network_acl_tags

    public_dedicated_network_acl = var.public_dedicated_network_acl
    public_inbound_acl_rules = var.public_inbound_acl_rules
    public_outbound_acl_rules = var.public_outbound_acl_rules
    public_acl_tags = var.public_acl_tags

    private_dedicated_network_acl = var.private_dedicated_network_acl
    private_inbound_acl_rules = var.private_inbound_acl_rules
    private_outbound_acl_rules = var.private_outbound_acl_rules
    private_acl_tags = var.private_acl_tags

    database_dedicated_network_acl = var.database_dedicated_network_acl
    database_inbound_acl_rules = var.database_inbound_acl_rules
    database_outbound_acl_rules = var.database_outbound_acl_rules
    database_acl_tags = var.database_acl_tags

    enable_nat_gateway = var.enable_nat_gateway
    single_nat_gateway = var.single_nat_gateway
    one_nat_gateway_per_az = var.one_nat_gateway_per_az
    reuse_nat_ips = var.reuse_nat_ips
    external_nat_ip_ids = var.external_nat_ip_ids
    nat_eip_tags = var.nat_eip_tags
    nat_gateway_tags = var.nat_gateway_tags

    customer_gateways = var.customer_gateways
    customer_gateway_tags = var.customer_gateway_tags

    manage_default_vpc = var.manage_default_vpc
    default_vpc_name = var.default_vpc_name
    default_vpc_enable_dns_support = var.default_vpc_enable_dns_support
    default_vpc_enable_dns_hostnames = var.default_vpc_enable_dns_hostnames
    default_vpc_tags = var.default_vpc_tags

    enable_flow_log = var.enable_flow_log
    flow_log_destination_type = var.flow_log_destination_type
    flow_log_destination_arn = var.flow_log_destination_arn
    flow_log_traffic_type = var.flow_log_traffic_type
    flow_log_max_aggregation_interval = var.flow_log_max_aggregation_interval
    vpc_flow_log_tags = var.vpc_flow_log_tags
    create_flow_log_cloudwatch_log_group = var.create_flow_log_cloudwatch_log_group
    flow_log_cloudwatch_log_group_name_prefix = var.flow_log_cloudwatch_log_group_name_prefix
    create_flow_log_cloudwatch_iam_role = var.create_flow_log_cloudwatch_iam_role
    flow_log_cloudwatch_iam_role_arn = var.flow_log_cloudwatch_iam_role_arn
    flow_log_cloudwatch_log_group_retention_in_days = var.flow_log_cloudwatch_log_group_retention_in_days
    flow_log_cloudwatch_log_group_kms_key_id = var.flow_log_cloudwatch_log_group_kms_key_id
    
    transit_gateway_id = var.transit_gateway_id
    tgwa_dns_support = var.tgwa_dns_support
    tgwa_ipv6_support = var.tgwa_ipv6_support
    tgwa_appliance_mode_support = var.tgwa_appliance_mode_support
    transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
    transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
    tgwa_tags = var.tgwa_tags
    tgw_route_destination_cidr_block = var.tgw_route_destination_cidr_block
    create_public_route = var.create_public_route
    
    create_endpoints = var.create_endpoints
    create_endpoint_sg = var.create_endpoint_sg
}