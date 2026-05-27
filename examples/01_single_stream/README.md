# Example 01: Single Stream

This example shows the smallest useful deployment for the **terraform-oci-fk-streaming** module:

- one OCI Streaming stream pool
- one stream named `FoggyKitchenIotEvents`

It is a minimal verification scenario for module consumers that want to start with a single event channel before moving into more advanced streaming topologies.

---

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
```

---

## What This Example Demonstrates

- stream pool creation
- stream creation in that pool
- basic module outputs for downstream consumers

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../../LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
