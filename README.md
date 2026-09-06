# DDCA Labs

Laboratory work for **DDCA (Digital Design and Computer Architecture)**, documenting the design and verification of digital logic circuits.

## Repository status

| Lab | Topic | Status |
| --- | --- | --- |
| [Lab 01](lab01/) | Digital comparators | Completed |
| [Lab 02](lab02/) | Hierarchical adders and FPGA mapping | Completed |

The repository currently contains Labs 01 and 02. Additional labs can be added as they are completed.

## Lab 01 overview

Lab 01 explores comparator circuits at gate level:

1. A 1-bit comparator with greater-than, equal-to, and less-than outputs.
2. The same comparator implemented using NAND gates only.
3. A 4-bit equality comparator assembled from bitwise comparison stages.

See the [Lab 01 notes](lab01/README.md) for the circuit equations and screenshots.

## Lab 02 overview

Lab 02 moves from gate-level arithmetic to modular Verilog and FPGA execution:

1. A one-bit full adder built from primitive logic gates.
2. A four-bit ripple-carry adder composed from four full-adder instances.
3. FPGA/NVBoard execution mapping two operands to eight switches and the five-bit result to LEDs.

See the [Lab 02 notes](lab02/README.md) for the design equations, I/O mapping, and NVBoard demonstration.

## Repository structure

```text
.
├── README.md
├── lab01/
│   ├── README.md
│   ├── Comparator/
│   ├── Comparator(only nand gate)/
│   └── 4-bit Comparator Circuit/
└── lab02/
    ├── README.md
    ├── onebitadder.v
    ├── fourbitadder.v
    └── assets/
```

## Notes

- The screenshots capture representative input combinations and output states.
- In Lab 01, blue wires and illuminated lamps indicate active logic signals. In the Lab 02 NVBoard screenshot, green LEDs indicate logic 1.
