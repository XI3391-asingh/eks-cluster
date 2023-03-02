################################################################################
# Database subnet
################################################################################

resource "aws_subnet" "database" {
  count                           = length(var.database_subnets) > 0 ? length(var.database_subnets) : 0
  vpc_id                          = local.vpc_id
  cidr_block                      = var.database_subnets[count.index]
  availability_zone               = length(regexall("^[a-z]{2}-", element(local.az_list, count.index))) > 0 ? element(local.az_list, count.index) : null
  availability_zone_id            = length(regexall("^[a-z]{2}-", element(local.az_list, count.index))) == 0 ? element(local.az_list, count.index) : null
  assign_ipv6_address_on_creation = var.database_subnet_assign_ipv6_address_on_creation
  ipv6_cidr_block                 = var.enable_ipv6 && length(var.database_subnet_ipv6_prefixes) > 0 ? cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, var.database_subnet_ipv6_prefixes[count.index]) : null
  tags = merge(
    {
      "Name" = format(
        "%s-${var.database_subnet_suffix}-%s",
        var.name,
        element(local.az_list, count.index),
      )
    },
    var.database_subnet_tags
  )
}

resource "aws_db_subnet_group" "database" {
  count       = length(var.database_subnets) > 0 && var.create_database_subnet_group ? 1 : 0
  name        = lower(coalesce(var.database_subnet_group_name, var.name))
  description = "Database subnet group for ${var.name}"
  subnet_ids  = aws_subnet.database.*.id
  tags = merge(
    {
      "Name" = format("%s", lower(coalesce(var.database_subnet_group_name, var.name)))
    },
    var.database_subnet_group_tags
  )
}

################################################################################
# Database Network ACLs
################################################################################

resource "aws_network_acl" "database" {
  count      = var.database_dedicated_network_acl && length(var.database_subnets) > 0 ? 1 : 0
  vpc_id     = element(concat(aws_vpc.vpc.*.id, [""]), 0)
  subnet_ids = aws_subnet.database.*.id
  tags = merge(
    {
      "Name" = format("%s-${var.database_subnet_suffix}", var.name)
    },
    var.database_acl_tags
  )
}

resource "aws_network_acl_rule" "database_inbound" {
  count           = var.database_dedicated_network_acl && length(var.database_subnets) > 0 ? length(var.database_inbound_acl_rules) : 0
  network_acl_id  = aws_network_acl.database[0].id
  egress          = false
  rule_number     = var.database_inbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.database_inbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.database_inbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.database_inbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.database_inbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.database_inbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.database_inbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.database_inbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.database_inbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

resource "aws_network_acl_rule" "database_outbound" {
  count           = var.database_dedicated_network_acl && length(var.database_subnets) > 0 ? length(var.database_outbound_acl_rules) : 0
  network_acl_id  = aws_network_acl.database[0].id
  egress          = true
  rule_number     = var.database_outbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.database_outbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.database_outbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.database_outbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.database_outbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.database_outbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.database_outbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.database_outbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.database_outbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

################################################################################
# Database routes
################################################################################

resource "aws_route_table" "database" {
  count  = var.create_database_subnet_route_table && length(var.database_subnets) > 0 ? var.single_nat_gateway || var.create_database_internet_gateway_route ? 1 : length(var.database_subnets) : 0
  vpc_id = local.vpc_id
  tags = merge(
    {
      "Name" = var.single_nat_gateway || var.create_database_internet_gateway_route ? "${var.name}-${var.database_subnet_suffix}" : format(
        "%s-${var.database_subnet_suffix}-%s",
        var.name,
        element(local.az_list, count.index),
      )
    },
    var.database_route_table_tags
  )
}

resource "aws_route" "database_internet_gateway" {
  count                  = var.create_igw && var.create_database_subnet_route_table && length(var.database_subnets) > 0 && var.create_database_internet_gateway_route && false == var.create_database_nat_gateway_route ? 1 : 0
  route_table_id         = aws_route_table.database[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id
  timeouts {
    create = "5m"
  }
}

resource "aws_route" "database_nat_gateway" {
  count                  = var.create_database_subnet_route_table && length(var.database_subnets) > 0 && false == var.create_database_internet_gateway_route && var.create_database_nat_gateway_route && var.enable_nat_gateway ? var.single_nat_gateway ? 1 : length(var.database_subnets) : 0
  route_table_id         = element(aws_route_table.database.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat.*.id, count.index)
  timeouts {
    create = "5m"
  }
}