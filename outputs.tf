output "stream_pool_id" {
  description = "OCI Streaming stream pool OCID."
  value       = oci_streaming_stream_pool.this.id
}

output "stream_pool_name" {
  description = "Resolved OCI Streaming stream pool name."
  value       = oci_streaming_stream_pool.this.name
}

output "stream_ids" {
  description = "Map of stream logical names to created stream OCIDs."
  value = {
    for key, stream in oci_streaming_stream.this :
    key => stream.id
  }
}

output "streams" {
  description = "Map of stream logical names with resolved OCI stream metadata."
  value = {
    for key, stream in oci_streaming_stream.this :
    key => {
      id                 = stream.id
      name               = stream.name
      partitions         = stream.partitions
      retention_in_hours = stream.retention_in_hours
      pool_id            = stream.stream_pool_id
    }
  }
}
