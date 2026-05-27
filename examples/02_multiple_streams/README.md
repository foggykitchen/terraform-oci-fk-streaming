# Example 02: Multiple Streams

This example expands the module contract to a simple multi-stream layout:

- one shared OCI Streaming stream pool
- one stream for IoT events
- one stream for audit-style events

It is a good fit for event-driven labs where different producers or consumers need separate channels but should stay in the same stream pool.

---

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
```

---

## What This Example Demonstrates

- shared stream pool creation
- multiple streams in one pool
- resolved output map for downstream modules or application stacks

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../../LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
