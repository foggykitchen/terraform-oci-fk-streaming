module "streaming" {
  source = "../.."

  name             = "fk-streaming-example02"
  compartment_ocid = var.compartment_ocid
  stream_pool_name = "FoggyKitchenStreamPool"

  streams = {
    iot_events = {
      name               = "FoggyKitchenIotEvents"
      partitions         = 1
      retention_in_hours = 24
    }
    app_audit = {
      name               = "FoggyKitchenAuditEvents"
      partitions         = 1
      retention_in_hours = 48
    }
  }
}
