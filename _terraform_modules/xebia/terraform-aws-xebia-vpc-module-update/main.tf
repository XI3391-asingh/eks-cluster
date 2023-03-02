provider "aws" {
  region = var.region
  default_tags {
    tags = var.extra_tags
  }
  assume_role {
    role_arn = var.assume_role_arn
  }
}

data "aws_availability_zones" "az" {
  state = "available"
}

locals {
  max_subnet_length = max(
    length(var.private_subnets),
    length(var.database_subnets)
  )
  az_list           = length(var.azs) == 0 ? flatten(tolist(data.aws_availability_zones.az.names)) : var.azs
  nat_gateway_count = var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(local.az_list) : local.max_subnet_length

  # Use `local.vpc_id` to give a hint to Terraform that subnets should be deleted before secondary CIDR blocks can be free!
  vpc_id = element(
    concat(
      aws_vpc_ipv4_cidr_block_association.ipv4_association.*.vpc_id,
      [aws_vpc.vpc.id],
      [""],
    ),
    0,
  )
}

################################################################################
# VPC
################################################################################

resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  assign_generated_ipv6_cidr_block = var.enable_ipv6
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}

resource "aws_vpc_ipv4_cidr_block_association" "ipv4_association" {
  count      = length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.secondary_cidr_blocks, count.index)
}

resource "aws_default_security_group" "vpc_sg" {
  count  = var.manage_default_security_group ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = var.default_security_group_ingress
    content {
      self             = lookup(ingress.value, "self", null)
      cidr_blocks      = compact(split(",", lookup(ingress.value, "cidr_blocks", "")))
      ipv6_cidr_blocks = compact(split(",", lookup(ingress.value, "ipv6_cidr_blocks", "")))
      prefix_list_ids  = compact(split(",", lookup(ingress.value, "prefix_list_ids", "")))
      security_groups  = compact(split(",", lookup(ingress.value, "security_groups", "")))
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", 0)
      to_port          = lookup(ingress.value, "to_port", 0)
      protocol         = lookup(ingress.value, "protocol", "-1")
    }
  }

  dynamic "egress" {
    for_each = var.default_security_group_egress
    content {
      self             = lookup(egress.value, "self", null)
      cidr_blocks      = compact(split(",", lookup(egress.value, "cidr_blocks", "")))
      ipv6_cidr_blocks = compact(split(",", lookup(egress.value, "ipv6_cidr_blocks", "")))
      prefix_list_ids  = compact(split(",", lookup(egress.value, "prefix_list_ids", "")))
      security_groups  = compact(split(",", lookup(egress.value, "security_groups", "")))
      description      = lookup(egress.value, "description", null)
      from_port        = lookup(egress.value, "from_port", 0)
      to_port          = lookup(egress.value, "to_port", 0)
      protocol         = lookup(egress.value, "protocol", "-1")
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.default_security_group_name)
    },
    var.default_security_group_tags
  )
}

################################################################################
# Default routes
################################################################################

resource "aws_default_route_table" "default" {
  count                  = var.manage_default_route_table ? 1 : 0
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  propagating_vgws       = var.default_route_table_propagating_vgws
  dynamic "route" {
    for_each = var.default_route_table_routes
    content {
      # One of the following destinations must be provided
      cidr_block      = route.value.cidr_block
      ipv6_cidr_block = lookup(route.value, "ipv6_cidr_block", null)
      # One of the following targets must be provided
      egress_only_gateway_id    = lookup(route.value, "egress_only_gateway_id", null)
      gateway_id                = lookup(route.value, "gateway_id", null)
      instance_id               = lookup(route.value, "instance_id", null)
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_endpoint_id           = lookup(route.value, "vpc_endpoint_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }
  tags = merge(
    { "Name" = var.name },
    var.default_route_table_tags,
  )
}

################################################################################
# Default Network ACLs
################################################################################

resource "aws_default_network_acl" "this" {
  count                  = var.manage_default_network_acl ? 1 : 0
  default_network_acl_id = element(concat(aws_vpc.vpc.*.default_network_acl_id, [""]), 0)
  # The value of subnet_ids should be any subnet IDs that are not set as subnet_ids for any of the non-default network ACLs
  subnet_ids = setsubtract(
    compact(flatten([
      aws_subnet.public.*.id,
      aws_subnet.private.*.id,
      aws_subnet.database.*.id
    ])),
    compact(flatten([
      aws_network_acl.public.*.subnet_ids,
      aws_network_acl.private.*.subnet_ids,
      aws_network_acl.database.*.subnet_ids
    ]))
  )
  dynamic "ingress" {
    for_each = var.default_network_acl_ingress
    content {
      action          = ingress.value.action
      cidr_block      = lookup(ingress.value, "cidr_block", null)
      from_port       = ingress.value.from_port
      icmp_code       = lookup(ingress.value, "icmp_code", null)
      icmp_type       = lookup(ingress.value, "icmp_type", null)
      ipv6_cidr_block = lookup(ingress.value, "ipv6_cidr_block", null)
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      to_port         = ingress.value.to_port
    }
  }
  dynamic "egress" {
    for_each = var.default_network_acl_egress
    content {
      action          = egress.value.action
      cidr_block      = lookup(egress.value, "cidr_block", null)
      from_port       = egress.value.from_port
      icmp_code       = lookup(egress.value, "icmp_code", null)
      icmp_type       = lookup(egress.value, "icmp_type", null)
      ipv6_cidr_block = lookup(egress.value, "ipv6_cidr_block", null)
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      to_port         = egress.value.to_port
    }
  }
  tags = merge(
    {
      "Name" = format("%s", var.default_network_acl_name)
    },
    var.default_network_acl_tags
  )
}

################################################################################
# Route table association
################################################################################

resource "aws_route_table_association" "private" {
  count     = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(
    aws_route_table.private.*.id,
    var.single_nat_gateway ? 0 : count.index,
  )
}

resource "aws_route_table_association" "database" {
  count     = length(var.database_subnets) > 0 ? length(var.database_subnets) : 0
  subnet_id = element(aws_subnet.database.*.id, count.index)
  route_table_id = element(
    coalescelist(aws_route_table.database.*.id, aws_route_table.private.*.id),
    var.create_database_subnet_route_table ? var.single_nat_gateway || var.create_database_internet_gateway_route ? 0 : count.index : count.index,
  )
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public[0].id
}

################################################################################
# Customer Gateways
################################################################################

resource "aws_customer_gateway" "customer_gateway" {
  for_each    = var.customer_gateways
  bgp_asn     = each.value["bgp_asn"]
  ip_address  = each.value["ip_address"]
  device_name = lookup(each.value, "device_name", null)
  type        = "ipsec.1"
  tags = merge(
    {
      Name = format("%s-%s", var.name, each.key)
    },
    var.customer_gateway_tags
  )
}

################################################################################
# Default vpc
################################################################################

resource "aws_default_vpc" "this" {
  count                = var.manage_default_vpc ? 1 : 0
  enable_dns_support   = var.default_vpc_enable_dns_support
  enable_dns_hostnames = var.default_vpc_enable_dns_hostnames
  tags = merge(
    {
      "Name" = format("%s", var.default_vpc_name)
    },
    var.default_vpc_tags
  )
}

################################################################################
# TGW ATTACHMENTS AND ROUTES
################################################################################

resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment" {
  count                                           = var.transit_gateway_id == "" ? 0 : 1
  subnet_ids                                      = aws_subnet.private[*].id
  transit_gateway_id                              = var.transit_gateway_id
  vpc_id                                          = aws_vpc.vpc.id
  dns_support                                     = var.tgwa_dns_support
  ipv6_support                                    = var.tgwa_ipv6_support
  appliance_mode_support                          = var.tgwa_appliance_mode_support ? "enable" : "disable"
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
  tags                                            = var.tgwa_tags
}

resource "aws_route" "tgw_route" {
  count                  = length(aws_route_table.private[*].id) > 0 && length(var.tgw_route_destination_cidr_block) > 0 ? length(aws_route_table.private[*].id) : 0
  route_table_id         = var.create_public_route ? aws_route_table.public[count.index].id : aws_route_table.private[count.index].id
  destination_cidr_block = var.tgw_route_destination_cidr_block[count.index]
  transit_gateway_id     = var.transit_gateway_id
  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment,
  ]
  timeouts {
    create = "5m"
  }
}

################################################################################
# Endpoint(s)
################################################################################

locals {
  endpoints = var.create_endpoints ? var.endpoints : tomap({})
}

data "aws_vpc_endpoint_service" "this" {
  for_each     = local.endpoints
  service      = lookup(each.value, "service", null)
  service_name = lookup(each.value, "service_name", null)
  filter {
    name   = "service-type"
    values = [lookup(each.value, "service_type", "Interface")]
  }
}

resource "aws_vpc_endpoint" "this" {
  for_each            = local.endpoints
  vpc_id              = aws_vpc.vpc.id
  service_name        = data.aws_vpc_endpoint_service.this[each.key].service_name
  vpc_endpoint_type   = lookup(each.value, "service_type", "Interface")
  auto_accept         = lookup(each.value, "auto_accept", null)
  security_group_ids  = lookup(each.value, "service_type", "Interface") == "Interface" ? distinct(concat(aws_security_group.endpoint[*].id, lookup(each.value, "security_group_ids", []))) : null
  subnet_ids          = lookup(each.value, "service_type", "Interface") == "Interface" ? distinct(concat(aws_subnet.private[*].id, lookup(each.value, "subnet_ids", []))) : null
  route_table_ids     = lookup(each.value, "service_type", "Interface") == "Gateway" ? lookup(each.value, "route_table_ids", null) : null
  policy              = lookup(each.value, "policy", null)
  private_dns_enabled = lookup(each.value, "service_type", "Interface") == "Interface" ? lookup(each.value, "private_dns_enabled", null) : null
  tags                = merge(var.tags, lookup(each.value, "tags", {}))
  timeouts {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

resource "aws_security_group" "endpoint" {
  count  = var.create_endpoints && var.create_endpoint_sg ? 1 : 0
  name   = var.vpc_endpoints_sg_name
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.vpc_endpoints_sg_name
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "endpoint" {
  for_each = { for k, v in var.vpc_endpoints_sg_rules : k => v }
  # Required
  security_group_id = aws_security_group.endpoint[0].id
  protocol          = each.value.protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  type              = each.value.type
  # Optional
  description              = try(each.value.description, null)
  cidr_blocks              = try(each.value.cidr_blocks, null)
  ipv6_cidr_blocks         = try(each.value.ipv6_cidr_blocks, null)
  prefix_list_ids          = try(each.value.prefix_list_ids, null)
  self                     = try(each.value.self, null)
  source_security_group_id = try(each.value.source_security_group_id, null)
}