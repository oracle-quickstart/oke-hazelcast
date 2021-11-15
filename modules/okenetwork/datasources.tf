# Copyright 2017, 2021 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

data "oci_core_subnets" "oke_subnets" {
  compartment_id = var.compartment_id
  vcn_id         = var.oke_network_vcn.vcn_id

  filter {
    name   = "state"
    values = ["AVAILABLE"]
  }
}

data "oci_waas_edge_subnets" "waf_cidr_blocks" {
  count = var.waf_enabled ? 1 : 0
}