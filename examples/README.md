# Examples

This directory contains small, focused examples for the **terraform-oci-fk-streaming** module.

The examples intentionally stay narrow in scope:

- start with a single stream in a pool
- then expand into multiple streams in the same pool

They are designed to validate the module contract and to serve as simple building blocks for larger event-driven scenarios such as:

- OCI Functions publishing to streams
- asynchronous processing pipelines
- IoT event ingestion
- ADB-backed downstream consumers

---

## Available Examples

| Example | Description |
|-------|-------------|
| `01_single_stream` | Minimal stream pool with one stream |
| `02_multiple_streams` | Shared stream pool with multiple streams |

---

## Usage Notes

- Copy `terraform.tfvars.example` to `terraform.tfvars`
- Fill in your OCI values
- Run `tofu init`
- Run `tofu plan`

These examples are meant to be **small verification scenarios**, not full application stacks.

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
