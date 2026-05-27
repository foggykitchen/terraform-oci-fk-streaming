output "stream_pool_id" {
  description = "Created stream pool OCID."
  value       = module.streaming.stream_pool_id
}

output "streams" {
  description = "Created stream metadata."
  value       = module.streaming.streams
}
