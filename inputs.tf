variable "name" {
  description = "Base name used for the stream pool when stream_pool_name is not provided explicitly."
  type        = string

  validation {
    condition     = trimspace(var.name) != ""
    error_message = "name must not be empty."
  }
}

variable "compartment_ocid" {
  description = "OCI compartment OCID where the stream pool and streams will be created."
  type        = string

  validation {
    condition     = trimspace(var.compartment_ocid) != ""
    error_message = "compartment_ocid must not be empty."
  }
}

variable "stream_pool_name" {
  description = "Optional explicit name for the stream pool. Defaults to name."
  type        = string
  default     = null
}

variable "streams" {
  description = "Map of streams keyed by logical name. Each stream can override its OCI display name, partitions, and retention."
  type = map(object({
    name               = optional(string)
    partitions         = optional(number, 1)
    retention_in_hours = optional(number, 24)
  }))
  default = {}

  validation {
    condition = alltrue([
      for stream in values(var.streams) :
      stream.partitions >= 1 && stream.retention_in_hours >= 1
    ])
    error_message = "Each stream must define partitions >= 1 and retention_in_hours >= 1."
  }
}
