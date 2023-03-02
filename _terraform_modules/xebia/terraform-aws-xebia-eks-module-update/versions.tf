terraform {
  required_version = ">= 1.3"

  required_providers {
    aws       = "= 4.48.0"
    cloudinit = "=2.2.0"
    tls       = "=4.0.4"
  }
}