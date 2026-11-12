# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_streaming_stream" {
    defaults = { "id" = "MOCK_OCID_STREAM", "lifecycle_state_details" = "mock-value", "messages_endpoint" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_streaming_stream_pool" {
    defaults = { "endpoint_fqdn" = "mock-value", "id" = "MOCK_OCID_POOL", "is_private" = false, "lifecycle_state_details" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
}
variables {
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
}

run "oci9_plan" {
  command = plan
}
