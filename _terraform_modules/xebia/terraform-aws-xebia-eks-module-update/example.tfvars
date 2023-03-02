region                  = "ap-south-1"
assume_role_arn         = "arn:aws:iam::474532148129:role/TerraformAdmin"
cluster_name            = "test"
cluster_version         = "1.23"
vpc_id                  = "vpc-026070aa90fbdd301"
subnet_ids              = ["subnet-0a249502716f6715d", "subnet-04b7960f300312134", "subnet-07b58f38585473d6d"]
endpoint_private_access = "false"
endpoint_public_access  = "true"
key_arn                 = "arn:aws:kms:ap-south-1:474532148129:key/3d5e25c9-70ae-4684-b02e-67270b0d19c5"
eks_managed_node_groups = {
  "worker-v1" : {
    "capacity_type" : "SPOT",
    "instance_types" : ["t3.medium"],
    "labels" : {
      "type" : "worker"
    },
    "max_size" : 2,
    "min_size" : 2,
    "desired_size" : 2,
    "subnet_ids" : ["subnet-0a249502716f6715d"]
  },
  "worker-v2" : {
    "capacity_type" : "SPOT",
    "instance_types" : ["t3.medium"],
    "labels" : {
      "type" : "worker"
    },
    "max_size" : 2,
    "min_size" : 2,
    "desired_size" : 2,
    "subnet_ids" : ["subnet-0a249502716f6715d", "subnet-07b58f38585473d6d", "subnet-04b7960f300312134"]
  },
}