# AWS Elastic Kubernetes Service (AWS EKS)

Terraform module to create an EKS Cluster

## Best Practices
- Enable IRSA for providing access to AWS Resources
- Setting up cluster autoscaler for worker nodes
- Using managed node groups for worker nodes
- Setting up cluster across multiple azs.
- Use IAM Roles to manage authentication

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.2.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 4.48.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | =2.2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | =4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | ./modules/eks-managed-node-group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.cluster_encryption](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cni_ipv6_policy](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cluster_encryption](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group) | resource |
| [aws_security_group.node](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.node](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/resources/security_group_rule) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cni_ipv6_policy](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/4.48.0/docs/data-sources/partition) | data source |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_arn"></a> [assume\_role\_arn](#input\_assume\_role\_arn) | the role to be assumed while creating resources | `string` | `""` | no |
| <a name="input_cluster_additional_security_group_ids"></a> [cluster\_additional\_security\_group\_ids](#input\_cluster\_additional\_security\_group\_ids) | list of security groups to attach to the cluster control plane | `list(string)` | `[]` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | name of the cluster | `string` | n/a | yes |
| <a name="input_cluster_security_group_additional_rules"></a> [cluster\_security\_group\_additional\_rules](#input\_cluster\_security\_group\_additional\_rules) | additional security group rules to add to the cluster security group | `map(string)` | `{}` | no |
| <a name="input_cluster_security_group_tags"></a> [cluster\_security\_group\_tags](#input\_cluster\_security\_group\_tags) | tags to add to the cluster security group | `map(string)` | `{}` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes version to use for EKS cluster | `string` | `"1.23"` | no |
| <a name="input_create_cni_ipv6_iam_policy"></a> [create\_cni\_ipv6\_iam\_policy](#input\_create\_cni\_ipv6\_iam\_policy) | whether to create an amazon eks policy for cni ipv6 | `bool` | `false` | no |
| <a name="input_eks_managed_node_group_defaults"></a> [eks\_managed\_node\_group\_defaults](#input\_eks\_managed\_node\_group\_defaults) | eks managed node group default definitions to create | `any` | <pre>{<br>  "ami_type": "AL2_x86_64",<br>  "disk_size": 50,<br>  "iam_role_attach_cni_policy": true<br>}</pre> | no |
| <a name="input_eks_managed_node_groups"></a> [eks\_managed\_node\_groups](#input\_eks\_managed\_node\_groups) | eks managed node group definitions to create | `any` | <pre>[<br>  {<br>    "capacity_type": "ON_DEMAND",<br>    "instance_types": [<br>      "m5.medium"<br>    ],<br>    "labels": {<br>      "type": "memory-intensive"<br>    },<br>    "max_size": 9,<br>    "min_size": 3,<br>    "name": "worker-1",<br>    "taints": {}<br>  }<br>]</pre> | no |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | Determines whether to create an OpenID Connect Provider for EKS to enable IRSA | `bool` | `true` | no |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | `list(string)` | <pre>[<br>  "audit",<br>  "api",<br>  "authenticator"<br>]</pre> | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | whether the eks private API server endpoint is enabled | `bool` | `false` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | whether the eks public API server endpoint is enabled | `bool` | `true` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | extra tags to be added to the resources | `map(string)` | `{}` | no |
| <a name="input_ip_family"></a> [ip\_family](#input\_ip\_family) | the ip family used to assign k8s pod and service addresses | `string` | `"ipv4"` | no |
| <a name="input_key_arn"></a> [key\_arn](#input\_key\_arn) | arn of the kms cmk to be used for encryption | `string` | n/a | yes |
| <a name="input_node_security_group_additional_rules"></a> [node\_security\_group\_additional\_rules](#input\_node\_security\_group\_additional\_rules) | additional security group rules to add to node security group | `map(string)` | `{}` | no |
| <a name="input_public_access_cidrs"></a> [public\_access\_cidrs](#input\_public\_access\_cidrs) | list of cidr blocks that can access the eks public api server endpoint when enabled | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region where resources are to be created | `string` | `"ap-south-1"` | no |
| <a name="input_service_ipv4_cidr"></a> [service\_ipv4\_cidr](#input\_service\_ipv4\_cidr) | the CIDR block to assign k8s pod and service IP addresses from | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | map of resource tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the cluster security group will be provisioned | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->