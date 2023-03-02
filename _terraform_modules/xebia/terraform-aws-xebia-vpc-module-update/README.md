<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.2.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.flow_log](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_customer_gateway.customer_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/customer_gateway) | resource |
| [aws_db_subnet_group.database](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/db_subnet_group) | resource |
| [aws_default_network_acl.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/default_network_acl) | resource |
| [aws_default_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/default_route_table) | resource |
| [aws_default_security_group.vpc_sg](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/default_security_group) | resource |
| [aws_default_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/default_vpc) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.transit_gateway_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/eip) | resource |
| [aws_flow_log.vpc_flow_log](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/flow_log) | resource |
| [aws_iam_policy.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/nat_gateway) | resource |
| [aws_network_acl.database](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl) | resource |
| [aws_network_acl.private](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl) | resource |
| [aws_network_acl.public](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.database_inbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.database_outbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.private_inbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.private_outbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_inbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_outbound](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/network_acl_rule) | resource |
| [aws_route.database_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route.database_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route.private_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route.public_internet_gateway_ipv6](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route.tgw_route](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route) | resource |
| [aws_route_table.database](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table) | resource |
| [aws_route_table_association.database](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/route_table_association) | resource |
| [aws_security_group.endpoint](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.endpoint](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.database](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/subnet) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_ipv4_cidr_block_association.ipv4_association](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_availability_zones.az](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy_document.flow_log_cloudwatch_assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document) | data source |
| [aws_vpc_endpoint_service.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/vpc_endpoint_service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_arn"></a> [assume\_role\_arn](#input\_assume\_role\_arn) | The role to be assumed while creating resources. | `string` | `""` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | list of availability zones (names or ids) in the region where subnets are to be created | `list(string)` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the VPC. | `string` | n/a | yes |
| <a name="input_create_database_internet_gateway_route"></a> [create\_database\_internet\_gateway\_route](#input\_create\_database\_internet\_gateway\_route) | whether an internet gateway route should be created for database subnets | `bool` | `false` | no |
| <a name="input_create_database_nat_gateway_route"></a> [create\_database\_nat\_gateway\_route](#input\_create\_database\_nat\_gateway\_route) | whether a nat gateway route should be created for database subnets | `bool` | `false` | no |
| <a name="input_create_database_subnet_group"></a> [create\_database\_subnet\_group](#input\_create\_database\_subnet\_group) | whether to create database subnet group | `bool` | `false` | no |
| <a name="input_create_database_subnet_route_table"></a> [create\_database\_subnet\_route\_table](#input\_create\_database\_subnet\_route\_table) | whether to create a route table for database subnets | `bool` | `false` | no |
| <a name="input_create_endpoint_sg"></a> [create\_endpoint\_sg](#input\_create\_endpoint\_sg) | whether to create security group for endpoints | `bool` | `false` | no |
| <a name="input_create_endpoints"></a> [create\_endpoints](#input\_create\_endpoints) | whether to create vpc endpoints | `bool` | `false` | no |
| <a name="input_create_flow_log_cloudwatch_iam_role"></a> [create\_flow\_log\_cloudwatch\_iam\_role](#input\_create\_flow\_log\_cloudwatch\_iam\_role) | whether to create an IAM role for VPC flow logs | `bool` | `true` | no |
| <a name="input_create_flow_log_cloudwatch_log_group"></a> [create\_flow\_log\_cloudwatch\_log\_group](#input\_create\_flow\_log\_cloudwatch\_log\_group) | whether to create cloudwatch log group for VPC flow logs | `bool` | `true` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | whether internet gateway and related routes needs to be created for public subnets | `bool` | `false` | no |
| <a name="input_create_public_route"></a> [create\_public\_route](#input\_create\_public\_route) | whether to create public routes in public route table | `bool` | `false` | no |
| <a name="input_customer_gateway_tags"></a> [customer\_gateway\_tags](#input\_customer\_gateway\_tags) | additional tags to associate with customer gateway | `map(string)` | `{}` | no |
| <a name="input_customer_gateways"></a> [customer\_gateways](#input\_customer\_gateways) | Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address) | `map(map(any))` | `{}` | no |
| <a name="input_database_acl_tags"></a> [database\_acl\_tags](#input\_database\_acl\_tags) | additional tags to associate with database network ACL | `map(string)` | `{}` | no |
| <a name="input_database_dedicated_network_acl"></a> [database\_dedicated\_network\_acl](#input\_database\_dedicated\_network\_acl) | whether to use dedicated network ACL (non-default) and custom rules for database subnets | `bool` | `false` | no |
| <a name="input_database_inbound_acl_rules"></a> [database\_inbound\_acl\_rules](#input\_database\_inbound\_acl\_rules) | database subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_database_outbound_acl_rules"></a> [database\_outbound\_acl\_rules](#input\_database\_outbound\_acl\_rules) | database subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_database_route_table_tags"></a> [database\_route\_table\_tags](#input\_database\_route\_table\_tags) | additional tags to associate with database route table | `map(string)` | `{}` | no |
| <a name="input_database_subnet_assign_ipv6_address_on_creation"></a> [database\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_database\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address | `bool` | `false` | no |
| <a name="input_database_subnet_group_name"></a> [database\_subnet\_group\_name](#input\_database\_subnet\_group\_name) | name of database subnet group | `string` | `""` | no |
| <a name="input_database_subnet_group_tags"></a> [database\_subnet\_group\_tags](#input\_database\_subnet\_group\_tags) | additional tags to associate with database subnet group | `map(string)` | `{}` | no |
| <a name="input_database_subnet_ipv6_prefixes"></a> [database\_subnet\_ipv6\_prefixes](#input\_database\_subnet\_ipv6\_prefixes) | Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256) | `list(string)` | `[]` | no |
| <a name="input_database_subnet_suffix"></a> [database\_subnet\_suffix](#input\_database\_subnet\_suffix) | suffix to append to database subnet names | `string` | `"db"` | no |
| <a name="input_database_subnet_tags"></a> [database\_subnet\_tags](#input\_database\_subnet\_tags) | additional tags to associate with database subnets | `map(string)` | `{}` | no |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | list of database subnets to create inside the VPC | `list(string)` | `[]` | no |
| <a name="input_default_network_acl_egress"></a> [default\_network\_acl\_egress](#input\_default\_network\_acl\_egress) | list of egress rules to set on the default network ACL | `list(map(string))` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  },<br>  {<br>    "action": "allow",<br>    "from_port": 0,<br>    "ipv6_cidr_block": "::/0",<br>    "protocol": "-1",<br>    "rule_no": 101,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_default_network_acl_ingress"></a> [default\_network\_acl\_ingress](#input\_default\_network\_acl\_ingress) | list of ingress rules to set on the default network ACL | `list(map(string))` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  },<br>  {<br>    "action": "allow",<br>    "from_port": 0,<br>    "ipv6_cidr_block": "::/0",<br>    "protocol": "-1",<br>    "rule_no": 101,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | name to associate with default network ACL | `string` | `""` | no |
| <a name="input_default_network_acl_tags"></a> [default\_network\_acl\_tags](#input\_default\_network\_acl\_tags) | additional tags to associate with default network ACL | `map(string)` | `{}` | no |
| <a name="input_default_route_table_propagating_vgws"></a> [default\_route\_table\_propagating\_vgws](#input\_default\_route\_table\_propagating\_vgws) | list of virtual gateways for propagation | `list(string)` | `[]` | no |
| <a name="input_default_route_table_routes"></a> [default\_route\_table\_routes](#input\_default\_route\_table\_routes) | list of rules to add to default route table | `list(map(string))` | `[]` | no |
| <a name="input_default_route_table_tags"></a> [default\_route\_table\_tags](#input\_default\_route\_table\_tags) | additional tags to associate with default route table | `map(string)` | `{}` | no |
| <a name="input_default_security_group_egress"></a> [default\_security\_group\_egress](#input\_default\_security\_group\_egress) | egress rules for default security group of the vpc | `list(map(string))` | `[]` | no |
| <a name="input_default_security_group_ingress"></a> [default\_security\_group\_ingress](#input\_default\_security\_group\_ingress) | ingress rules for default security group of the vpc | `list(map(string))` | `[]` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | name of the default security group | `string` | `""` | no |
| <a name="input_default_security_group_tags"></a> [default\_security\_group\_tags](#input\_default\_security\_group\_tags) | additional tags to associate with default security group | `map(string)` | `{}` | no |
| <a name="input_default_vpc_enable_dns_hostnames"></a> [default\_vpc\_enable\_dns\_hostnames](#input\_default\_vpc\_enable\_dns\_hostnames) | whether to enable DNS hostnames in the default VPC | `bool` | `false` | no |
| <a name="input_default_vpc_enable_dns_support"></a> [default\_vpc\_enable\_dns\_support](#input\_default\_vpc\_enable\_dns\_support) | whether to enable dns support in default VPC | `bool` | `false` | no |
| <a name="input_default_vpc_name"></a> [default\_vpc\_name](#input\_default\_vpc\_name) | name to be associated with default vpc | `string` | `""` | no |
| <a name="input_default_vpc_tags"></a> [default\_vpc\_tags](#input\_default\_vpc\_tags) | additional tags to associate with default vpc | `map(string)` | `{}` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Should be true to enable DNS hostnames in the VPC. | `bool` | `false` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Determines whether the VPC supports DNS resolution through the Amazon provided DNS server. | `bool` | `true` | no |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | whether or not to enable VPC flow logs | `bool` | `true` | no |
| <a name="input_enable_ipv6"></a> [enable\_ipv6](#input\_enable\_ipv6) | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC | `bool` | `false` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | whether to create NAT gateway(s) | `bool` | `false` | no |
| <a name="input_endpoints"></a> [endpoints](#input\_endpoints) | A map of endpoint configurations | `map(any)` | `{}` | no |
| <a name="input_external_nat_ip_ids"></a> [external\_nat\_ip\_ids](#input\_external\_nat\_ip\_ids) | list of EIP ID(s) to be assigned to the NAT Gateway(s) | `list(string)` | `[]` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to resources. | `map(string)` | `{}` | no |
| <a name="input_flow_log_cloudwatch_iam_role_arn"></a> [flow\_log\_cloudwatch\_iam\_role\_arn](#input\_flow\_log\_cloudwatch\_iam\_role\_arn) | ARN of existing IAM role for VPC flow log cloudwatch log group | `string` | `""` | no |
| <a name="input_flow_log_cloudwatch_log_group_kms_key_id"></a> [flow\_log\_cloudwatch\_log\_group\_kms\_key\_id](#input\_flow\_log\_cloudwatch\_log\_group\_kms\_key\_id) | ARN of the KMS key to use when encyrpting log data for VPC flow logs | `string` | `null` | no |
| <a name="input_flow_log_cloudwatch_log_group_name_prefix"></a> [flow\_log\_cloudwatch\_log\_group\_name\_prefix](#input\_flow\_log\_cloudwatch\_log\_group\_name\_prefix) | name prefix of cloudwatch log group for VPC flow logs | `string` | `"/aws/vpc-flow-log/"` | no |
| <a name="input_flow_log_cloudwatch_log_group_retention_in_days"></a> [flow\_log\_cloudwatch\_log\_group\_retention\_in\_days](#input\_flow\_log\_cloudwatch\_log\_group\_retention\_in\_days) | no of days log events should be retained | `number` | `null` | no |
| <a name="input_flow_log_destination_arn"></a> [flow\_log\_destination\_arn](#input\_flow\_log\_destination\_arn) | the ARN of the cloudwatch log group or s3 bucket where VPC flow logs will be pushed | `string` | `""` | no |
| <a name="input_flow_log_destination_type"></a> [flow\_log\_destination\_type](#input\_flow\_log\_destination\_type) | Type of flow log destination. Can be s3 or cloud-watch-logs | `string` | `"cloud-watch-logs"` | no |
| <a name="input_flow_log_max_aggregation_interval"></a> [flow\_log\_max\_aggregation\_interval](#input\_flow\_log\_max\_aggregation\_interval) | the max interval of time during which a particular flow is captured and aggregated into a flow record | `number` | `600` | no |
| <a name="input_flow_log_traffic_type"></a> [flow\_log\_traffic\_type](#input\_flow\_log\_traffic\_type) | the type of traffic to capture, valid values are ACCEPT, REJECT, ALL | `string` | `"ALL"` | no |
| <a name="input_igw_tags"></a> [igw\_tags](#input\_igw\_tags) | additional tags to associate with internet gateway | `map(string)` | `{}` | no |
| <a name="input_manage_default_network_acl"></a> [manage\_default\_network\_acl](#input\_manage\_default\_network\_acl) | whether to adopt and manage default network ACL | `bool` | `false` | no |
| <a name="input_manage_default_route_table"></a> [manage\_default\_route\_table](#input\_manage\_default\_route\_table) | should be true to manage default route table | `bool` | `false` | no |
| <a name="input_manage_default_security_group"></a> [manage\_default\_security\_group](#input\_manage\_default\_security\_group) | whether to manage default security group | `bool` | `false` | no |
| <a name="input_manage_default_vpc"></a> [manage\_default\_vpc](#input\_manage\_default\_vpc) | whether to manage default vpc | `bool` | `false` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | whether instances launched in the subnets should be assigned a public ip address on launch | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC. | `string` | n/a | yes |
| <a name="input_nat_eip_tags"></a> [nat\_eip\_tags](#input\_nat\_eip\_tags) | additional tags to associate with NAT EIP(s) | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_tags"></a> [nat\_gateway\_tags](#input\_nat\_gateway\_tags) | additional tags to associate with NAT gateway(s) | `map(string)` | `{}` | no |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs` | `bool` | `false` | no |
| <a name="input_private_acl_tags"></a> [private\_acl\_tags](#input\_private\_acl\_tags) | additional tags to associate with private network ACL | `map(string)` | `{}` | no |
| <a name="input_private_dedicated_network_acl"></a> [private\_dedicated\_network\_acl](#input\_private\_dedicated\_network\_acl) | whether to use dedicated network ACL (non-default) and custom rules for private subnets | `bool` | `false` | no |
| <a name="input_private_inbound_acl_rules"></a> [private\_inbound\_acl\_rules](#input\_private\_inbound\_acl\_rules) | private subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_private_outbound_acl_rules"></a> [private\_outbound\_acl\_rules](#input\_private\_outbound\_acl\_rules) | private subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_private_route_table_tags"></a> [private\_route\_table\_tags](#input\_private\_route\_table\_tags) | additional tags to associate with private route table | `map(string)` | `{}` | no |
| <a name="input_private_subnet_assign_ipv6_address_on_creation"></a> [private\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_private\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address | `bool` | `false` | no |
| <a name="input_private_subnet_ipv6_prefixes"></a> [private\_subnet\_ipv6\_prefixes](#input\_private\_subnet\_ipv6\_prefixes) | Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256) | `list(string)` | `[]` | no |
| <a name="input_private_subnet_suffix"></a> [private\_subnet\_suffix](#input\_private\_subnet\_suffix) | suffix to append to private subnet names | `string` | `"private"` | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | additional tags to associate with private subnets | `map(string)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | list of private subnets to create inside the VPC | `list(string)` | `[]` | no |
| <a name="input_public_acl_tags"></a> [public\_acl\_tags](#input\_public\_acl\_tags) | additional tags to associate with public network ACL | `map(string)` | `{}` | no |
| <a name="input_public_dedicated_network_acl"></a> [public\_dedicated\_network\_acl](#input\_public\_dedicated\_network\_acl) | whether to use dedicated network ACL (non-default) and custom rules for public subnets | `bool` | `false` | no |
| <a name="input_public_inbound_acl_rules"></a> [public\_inbound\_acl\_rules](#input\_public\_inbound\_acl\_rules) | public subnets inbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_outbound_acl_rules"></a> [public\_outbound\_acl\_rules](#input\_public\_outbound\_acl\_rules) | public subnets outbound network ACL rules | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_route_table_tags"></a> [public\_route\_table\_tags](#input\_public\_route\_table\_tags) | additional tags to associate with public route table | `map(string)` | `{}` | no |
| <a name="input_public_subnet_assign_ipv6_address_on_creation"></a> [public\_subnet\_assign\_ipv6\_address\_on\_creation](#input\_public\_subnet\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the subnets should be assigned an IPv6 address | `bool` | `false` | no |
| <a name="input_public_subnet_ipv6_prefixes"></a> [public\_subnet\_ipv6\_prefixes](#input\_public\_subnet\_ipv6\_prefixes) | Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256) | `list(string)` | `[]` | no |
| <a name="input_public_subnet_suffix"></a> [public\_subnet\_suffix](#input\_public\_subnet\_suffix) | suffix to append to public subnet names | `string` | `"public"` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | additional tags to associate with public subnets | `map(string)` | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | list of public subnets to create inside the VPC | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region where resources will be created. | `string` | `"ap-south-1"` | no |
| <a name="input_reuse_nat_ips"></a> [reuse\_nat\_ips](#input\_reuse\_nat\_ips) | whether to use existing EIP(s) for NAT Gateway(s) being created instead of creating new EIP(s) | `bool` | `false` | no |
| <a name="input_secondary_cidr_blocks"></a> [secondary\_cidr\_blocks](#input\_secondary\_cidr\_blocks) | list of additional ipv4 cidr blocks to associate with vpc | `list(string)` | `[]` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | whether to create a single shared NAT gateway for all private subnets | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | additional tags to associate with vpc | `map(string)` | `{}` | no |
| <a name="input_tgw_route_destination_cidr_block"></a> [tgw\_route\_destination\_cidr\_block](#input\_tgw\_route\_destination\_cidr\_block) | The destination CIDR bocks for private/public route table tgw routes | `list(string)` | `[]` | no |
| <a name="input_tgwa_appliance_mode_support"></a> [tgwa\_appliance\_mode\_support](#input\_tgwa\_appliance\_mode\_support) | Whether Appliance Mode support is enabled. If enabled, a traffic flow between a source and destination uses the same Availability Zone for the VPC attachment for the lifetime of that flow. | `bool` | `false` | no |
| <a name="input_tgwa_dns_support"></a> [tgwa\_dns\_support](#input\_tgwa\_dns\_support) | Whether DNS support is enabled. Valid values are disable, enable | `string` | `"enable"` | no |
| <a name="input_tgwa_ipv6_support"></a> [tgwa\_ipv6\_support](#input\_tgwa\_ipv6\_support) | Whether IPv6 support is enabled. Valid values are disable, enable | `string` | `"disable"` | no |
| <a name="input_tgwa_tags"></a> [tgwa\_tags](#input\_tgwa\_tags) | additional tags to associate with tgwa | `map(string)` | `{}` | no |
| <a name="input_transit_gateway_default_route_table_association"></a> [transit\_gateway\_default\_route\_table\_association](#input\_transit\_gateway\_default\_route\_table\_association) | whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table | `bool` | `false` | no |
| <a name="input_transit_gateway_default_route_table_propagation"></a> [transit\_gateway\_default\_route\_table\_propagation](#input\_transit\_gateway\_default\_route\_table\_propagation) | whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table | `bool` | `false` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | ID of transit gateway for which attachment is to be created | `string` | `""` | no |
| <a name="input_vpc_endpoints_sg_name"></a> [vpc\_endpoints\_sg\_name](#input\_vpc\_endpoints\_sg\_name) | name for the sg for endpoints | `string` | `""` | no |
| <a name="input_vpc_endpoints_sg_rules"></a> [vpc\_endpoints\_sg\_rules](#input\_vpc\_endpoints\_sg\_rules) | list of rules to add to endpoints sg | `list(map(string))` | `[]` | no |
| <a name="input_vpc_flow_log_tags"></a> [vpc\_flow\_log\_tags](#input\_vpc\_flow\_log\_tags) | additional tags to associate with vpc flow logs | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ec2_transit_gateway_vpc_attachment_id"></a> [aws\_ec2\_transit\_gateway\_vpc\_attachment\_id](#output\_aws\_ec2\_transit\_gateway\_vpc\_attachment\_id) | The transit gateway attachment id |
| <a name="output_aws_route_tgw_route_id"></a> [aws\_route\_tgw\_route\_id](#output\_aws\_route\_tgw\_route\_id) | Route entry id |
| <a name="output_database_subnet_arns"></a> [database\_subnet\_arns](#output\_database\_subnet\_arns) | List of ARNs of database subnets |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of database subnets |
| <a name="output_default_network_acl_id"></a> [default\_network\_acl\_id](#output\_default\_network\_acl\_id) | The ID of the default network ACL |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the security group created by default on VPC creation |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpc_public_route_table"></a> [vpc\_public\_route\_table](#output\_vpc\_public\_route\_table) | Public route table IDs |
<!-- END_TF_DOCS -->