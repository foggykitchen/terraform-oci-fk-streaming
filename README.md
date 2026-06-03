# terraform-oci-fk-streaming

This repository contains a reusable **Terraform/OpenTofu module** and focused examples for deploying **Oracle Cloud Infrastructure (OCI) Streaming** stream pools and streams.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed to work cleanly with reusable infrastructure modules such as **`terraform-oci-fk-function`**, **`terraform-oci-fk-ons`**, and future event-driven integration components.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI Streaming:

- Focused on OCI-native stream pool and stream primitives
- Suitable for Functions-based ingestion, asynchronous workflows, and event-driven processing pipelines
- Designed for hands-on learning, module composition, and streaming integration scenarios

This is **not** a full messaging platform abstraction. It is a **small, explicit infrastructure module** for OCI Streaming.

---

## What the module does

The module creates:

- OCI Streaming stream pool
- Zero or more OCI Streams within that pool

The module intentionally does **not** create:

- OCI Functions applications or functions
- VCNs or subnets
- IAM policies for publishers or consumers
- Notifications topics or subscriptions
- Service Connector Hub resources
- API Gateways

Each of those concerns belongs in its own dedicated module.

---

## Repository Structure

```bash
terraform-oci-fk-streaming/
├── examples/
│   ├── 01_single_stream/
│   ├── 02_multiple_streams/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

The examples are intentionally small and show **incremental Streaming patterns**, starting from a single stream and then moving into a simple multi-stream pool layout.

---

## Example Usage

### Single stream

```hcl
module "streaming" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-streaming.git?ref=v0.1.0"

  name             = "fk-streaming-demo"
  compartment_ocid = var.compartment_ocid

  streams = {
    iot_events = {
      name               = "FoggyKitchenIotEvents"
      partitions         = 1
      retention_in_hours = 24
    }
  }
}
```

### Multiple streams in one pool

```hcl
module "streaming" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-streaming.git?ref=v0.1.0"

  name             = "fk-streaming-demo"
  compartment_ocid = var.compartment_ocid
  stream_pool_name = "FoggyKitchenStreamPool"

  streams = {
    iot_events = {
      partitions         = 1
      retention_in_hours = 24
    }
    audit_events = {
      partitions         = 1
      retention_in_hours = 48
    }
  }
}
```

---

## Module Inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `name` | `string` | ✅ | Base name used for the stream pool when `stream_pool_name` is not provided |
| `compartment_ocid` | `string` | ✅ | OCI compartment OCID |
| `stream_pool_name` | `string` | ❌ | Optional explicit stream pool name override |
| `streams` | `map(object({ name = optional(string), partitions = optional(number, 1), retention_in_hours = optional(number, 24) }))` | ❌ | Streams keyed by logical name |

The module accepts an empty `streams` map when you want to create the stream pool first and attach streams later.

---

## Outputs

| Output | Description |
|------|-------------|
| `stream_pool_id` | Stream pool OCID |
| `stream_pool_name` | Resolved stream pool name |
| `stream_ids` | Map of logical stream names to OCIDs |
| `streams` | Map with stream OCID, name, partitions, retention, and pool ID |

---

## Examples Overview

| Example | Description |
|-------|-------------|
| `01_single_stream` | Minimal OCI Streaming setup with one stream in one pool |
| `02_multiple_streams` | Single stream pool with multiple streams for a simple event pipeline |

See [`examples/`](examples) for details.

---

## Design Philosophy

- Explicit over implicit
- Small modules over monoliths
- Streaming separated from publishers, consumers, and networking
- Optimized for **learning, reuse, and composition**

This makes the module ideal for:

- Event-driven Function pipelines
- IoT ingestion scenarios
- Async OCI integration workshops
- Multimodule training scenarios

---

## Related Resources

- [FoggyKitchen OCI Function Module (terraform-oci-fk-function)](https://github.com/foggykitchen/terraform-oci-fk-function)
- [FoggyKitchen OCI ONS Module (terraform-oci-fk-ons)](https://github.com/foggykitchen/terraform-oci-fk-ons)
- [FoggyKitchen OCI API Gateway Module (terraform-oci-fk-api-gateway)](https://github.com/foggykitchen/terraform-oci-fk-api-gateway)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
