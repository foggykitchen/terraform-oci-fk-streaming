module "streaming" {
  source = "../.."

  name             = "fk-streaming-example01"
  compartment_ocid = var.compartment_ocid

  streams = {
    iot_events = {
      name               = "FoggyKitchenIotEvents"
      partitions         = 1
      retention_in_hours = 24
    }
  }
}
