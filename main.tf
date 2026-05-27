locals {
  resolved_stream_pool_name = coalesce(var.stream_pool_name, var.name)
}

resource "oci_streaming_stream_pool" "this" {
  compartment_id = var.compartment_ocid
  name           = local.resolved_stream_pool_name
}

resource "oci_streaming_stream" "this" {
  for_each = var.streams

  name               = coalesce(try(each.value.name, null), each.key)
  partitions         = each.value.partitions
  retention_in_hours = each.value.retention_in_hours
  stream_pool_id     = oci_streaming_stream_pool.this.id
}
