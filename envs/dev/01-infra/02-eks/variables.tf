# PROVIDER CONFIGURATION

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region where resources are to be created"
}
variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "extra tags to be added to the resources"
}
variable "assume_role_arn" {
  type        = string
  default     = ""
  description = "the role to be assumed while creating resources"
}

# CLUSTER CONFIGURATION

variable "cluster_name" {
  type        = string
  description = "name of the cluster"
  validation {
    error_message = "Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores."
    condition     = can(regex("^[0-9A-Za-z][A-Za-z0-9\\-_]+$", var.cluster_name))
  }
}
variable "cluster_version" {
  type        = string
  description = "Kubernetes version to use for EKS cluster"
  default     = "1.23"
}
variable "enable_irsa" {
  type        = bool
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  default     = true
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "map of resource tags"
}


# CLUSTER VPC CONFIG

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the cluster security group will be provisioned"
}
variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs where the EKS cluster (ENIs) will be provisioned along with the nodes/node groups. Node groups can be deployed within a different set of subnet IDs from within the node group configuration"
}
variable "endpoint_private_access" {
  type        = bool
  default     = false
  description = "whether the eks private API server endpoint is enabled"
}
variable "endpoint_public_access" {
  type        = bool
  default     = true
  description = "whether the eks public API server endpoint is enabled"
}
variable "public_access_cidrs" {
  type        = list(string)
  description = "list of cidr blocks that can access the eks public api server endpoint when enabled"
  default     = []
}
variable "cluster_security_group_tags" {
  type        = map(string)
  description = "tags to add to the cluster security group"
  default     = {}
}
variable "cluster_security_group_additional_rules" {
  type        = map(string)
  default     = {}
  description = "additional security group rules to add to the cluster security group"
}
variable "cluster_additional_security_group_ids" {
  type        = list(string)
  description = "list of security groups to attach to the cluster control plane"
  default     = []
}

# LOGGING CONFIGURATION

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = ["audit", "api", "authenticator"]
}

# ENCRYPTION CONFIGURATION

variable "key_arn" {
  type        = string
  description = "arn of the kms cmk to be used for encryption"
}

# NETWORK CONFIGURATION

variable "ip_family" {
  type        = string
  default     = "ipv4"
  description = "the ip family used to assign k8s pod and service addresses"
  validation {
    error_message = "Valid values are ipv4 and ipv6."
    condition     = contains(["ipv4", "ipv6"], var.ip_family)
  }
}
variable "service_ipv4_cidr" {
  type        = string
  default     = null
  description = "the CIDR block to assign k8s pod and service IP addresses from"
}
variable "create_cni_ipv6_iam_policy" {
  type        = bool
  default     = false
  description = "whether to create an amazon eks policy for cni ipv6"
}

# NODE GROUP CONFIGURATION

variable "node_security_group_additional_rules" {
  type        = map(string)
  description = "additional security group rules to add to node security group"
  default     = {}
}
variable "eks_managed_node_group_defaults" {
  type        = any
  description = "eks managed node group default definitions to create"
  default = {
    ami_type                   = "AL2_x86_64"
    disk_size                  = 50
    iam_role_attach_cni_policy = true
  }
}
variable "eks_managed_node_groups" {
  type        = any
  description = "eks managed node group definitions to create"
  default = [{
    name           = "worker-1"
    min_size       = 3
    max_size       = 9
    instance_types = ["m5.medium"]
    capacity_type  = "ON_DEMAND"
    labels         = { type = "memory-intensive" }
    taints         = {}
  }]
  validation {
    condition     = alltrue([for group in var.eks_managed_node_groups : group.min_size >= 2])
    error_message = "Minimum capacity of a node group must be greater than or equal to two."
  }
}