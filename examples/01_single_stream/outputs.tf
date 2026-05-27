output "stream_pool_id" {
  description = "Created stream pool OCID."
  value       = module.streaming.stream_pool_id
}

output "stream_ids" {
  description = "Created stream OCIDs."
  value       = module.streaming.stream_ids
}
