# DDCA Labs

Laboratory work for **DDCA (Digital Design and Computer Architecture)**, documenting the design and verification of digital logic circuits.

## Repository status

| Lab | Topic | Status |
| --- | --- | --- |
| [Lab 01](lab01/) | Digital comparators | Completed |
| [Lab 02](lab02/) | Hierarchical adders and FPGA mapping | Completed |
| [Lab 03](lab03/) | Adder with hexadecimal seven-segment display | Completed |
| [Lab 04](lab04/) | Sequential turn-signal finite-state machine | Completed |

The repository currently contains Labs 01-04. Additional labs can be added as they are completed.

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

## Lab 03 overview

Lab 03 adds a hexadecimal seven-segment display to the four-bit adder:

1. Reuse the gate-level full adder and four-bit ripple-carry structure.
2. Decode the low four sum bits into an active-low seven-segment pattern.
3. Show carry-out on LED4, demonstrated with `9 + 9 = 18` and `1 + 3 = 4` in NVBoard.

See the [Lab 03 notes](lab03/README.md) for the module roles, display interpretation, and both running-result screenshots.

## Lab 04 overview

Lab 04 introduces sequential logic through a car-style turn-signal controller:

1. Model idle, left-turn, and right-turn sequences with a seven-state FSM.
2. Progressively illuminate three lamps on the requested side using a divided clock enable.
3. Verify both directions in a Vivado behavioral simulation and demonstrate them on NVBoard.

See the [Lab 04 notes](lab04/README.md) for the state sequence, timing, Vivado waveform, and NVBoard results.

## Repository structure

```text
.
├── README.md
├── lab01/
│   ├── README.md
│   ├── Comparator/
│   ├── Comparator(only nand gate)/
│   └── 4-bit Comparator Circuit/
├── lab02/
│   ├── README.md
│   ├── onebitadder.v
│   ├── fourbitadder.v
│   └── assets/
├── lab03/
│   ├── README.md
│   ├── FullAdder.v
│   ├── FourBitAdder.v
│   ├── Decoder.v
│   ├── top.v
│   └── assets/
└── lab04/
    ├── README.md
    ├── fsm.v
    ├── clk_div.v
    ├── fsm_tb.v
    └── assets/
```

## Notes

- The screenshots capture representative input combinations and output states.
- In Lab 01, blue wires and illuminated lamps indicate active logic signals. In the Lab 02-Lab 04 NVBoard screenshots, green LEDs indicate logic 1.
