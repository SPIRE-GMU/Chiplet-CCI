# SHA-256 Hardened Layout (OpenLane)

This repository contains the OpenLane-based physical design (layout) of the SHA-256 Verilog module.

## Files Description

- `src/sha256.v` – Verilog RTL source file for the SHA-256 module.
- `runs/` – Contains OpenLane run results including  for the SHA-256 design.
- `config.json` – OpenLane configuration file specifying synthesis, floorplanning, placement, and routing settings for the SHA-256 module.

## Notes

- Physical design generated using OpenLane flow.
- The layout includes fully placed, routed, and hardened versions of the SHA-256 design.
- Target PDK: [Sky130A ].
