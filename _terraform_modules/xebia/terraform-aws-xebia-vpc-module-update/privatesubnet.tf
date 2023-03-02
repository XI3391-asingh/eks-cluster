################################################################################
# Private routes
# There are as many routing tables as the number of NAT gateways
################################################################################

resource "aws_route_table" "private" {
  count  = local.max_subnet_length > 0 ? local.nat_gateway_count : 0
  vpc_id = local.vpc_id
  tags = merge(
    {
      "Name" = var.single_nat_gateway ? "${var.name}-${var.private_subnet_suffix}" : format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(local.az_list, count.index),
      )
    },
    var.private_route_table_tags
  )
}

################################################################################
# Private subnet
################################################################################

resource "aws_subnet" "private" {
  count                           = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  vpc_id                          = local.vpc_id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = length(regexall("^[a-z]{2}-", element(local.az_list, count.index))) > 0 ? element(local.az_list, count.index) : null
  availability_zone_id            = length(regexall("^[a-z]{2}-", element(local.az_list, count.index))) == 0 ? element(local.az_list, count.index) : null
  assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation
  ipv6_cidr_block                 = var.enable_ipv6 && length(var.private_subnet_ipv6_prefixes) > 0 ? cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, var.private_subnet_ipv6_prefixes[count.index]) : null

  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(local.az_list, count.index),
      )
    },
    var.private_subnet_tags
  )
}

################################################################################
# Private Network ACLs
################################################################################

resource "aws_network_acl" "private" {
  count      = var.private_dedicated_network_acl && length(var.private_subnets) > 0 ? 1 : 0
  vpc_id     = element(concat(aws_vpc.vpc.*.id, [""]), 0)
  subnet_ids = aws_subnet.private.*.id
  tags = merge(
    {
      "Name" = format("%s-${var.private_subnet_suffix}", var.name)
    },
    var.private_acl_tags
  )
}

resource "aws_network_acl_rule" "private_inbound" {
  count           = var.private_dedicated_network_acl && length(var.private_subnets) > 0 ? length(var.private_inbound_acl_rules) : 0
  network_acl_id  = aws_network_acl.private[0].id
  egress          = false
  rule_number     = var.private_inbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.private_inbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.private_inbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.private_inbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.private_inbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.private_inbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.private_inbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.private_inbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.private_inbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

resource "aws_network_acl_rule" "private_outbound" {
  count           = var.private_dedicated_network_acl && length(var.private_subnets) > 0 ? length(var.private_outbound_acl_rules) : 0
  network_acl_id  = aws_network_acl.private[0].id
  egress          = true
  rule_number     = var.private_outbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.private_outbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.private_outbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.private_outbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.private_outbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.private_outbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.private_outbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.private_outbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.private_outbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

################################################################################
# NAT Gateway
################################################################################

# The logical expression would be
#    nat_gateway_ips = var.reuse_nat_ips ? var.external_nat_ip_ids : aws_eip.nat.*.id
# but then when count of aws_eip.nat.*.id is zero, this would throw a resource not found error on aws_eip.nat.*.id.
locals {
  nat_gateway_ips = split(
    ",",
    var.reuse_nat_ips ? join(",", var.external_nat_ip_ids) : join(",", aws_eip.nat.*.id),
  )
}

resource "aws_eip" "nat" {
  count = var.enable_nat_gateway && false == var.reuse_nat_ips ? local.nat_gateway_count : 0
  vpc   = true
  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(local.az_list, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.nat_eip_tags
  )
}

resource "aws_nat_gateway" "nat" {
  count = var.enable_nat_gateway ? local.nat_gateway_count : 0
  allocation_id = element(
    local.nat_gateway_ips,
    var.single_nat_gateway ? 0 : count.index,
  )
  subnet_id = element(
    aws_subnet.public.*.id,
    var.single_nat_gateway ? 0 : count.index,
  )
  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(local.az_list, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.nat_gateway_tags
  )
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "private_nat_gateway" {
  count                  = var.enable_nat_gateway ? local.nat_gateway_count : 0
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat.*.id, count.index)
  timeouts {
    create = "5m"
  }
}