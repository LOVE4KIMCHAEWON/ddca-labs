# Lab 05 - 32-Bit Arithmetic Logic Unit

Lab 05 implements a combinational 32-bit arithmetic logic unit (ALU). Two 32-bit operands and a four-bit operation code select an arithmetic, comparison, or bitwise operation; the design also reports whether the result is zero.

## Design

| File | Role |
| --- | --- |
| [src/alu.v](src/alu.v) | Implements the arithmetic path, logic path, result multiplexer, and zero detector. |
| [src/timing.xdc](src/timing.xdc) | Applies a 20 ns maximum input-to-output delay constraint. |
| [reports/](reports/) | Contains Vivado I/O, placed-utilization, and routed-timing reports. |

The module interface is:

| Port | Width | Direction | Meaning |
| --- | ---: | --- | --- |
| `A` | 32 | Input | First operand. |
| `B` | 32 | Input | Second operand. |
| `AluOp` | 4 | Input | Selects the ALU operation. |
| `Result` | 32 | Output | Selected arithmetic or logic result. |
| `Zero` | 1 | Output | High when every bit of `Result` is zero. |

## Operations

The following canonical `AluOp` values select the seven implemented operations:

| `AluOp` | Operation | Result |
| --- | --- | --- |
| `0000` | ADD | `A + B` |
| `0010` | SUB | `A - B` |
| `1010` | SLT | The sign bit of `A - B`, zero-extended to 32 bits. |
| `0100` | AND | `A & B` |
| `0101` | OR | `A \| B` |
| `0110` | XOR | `A ^ B` |
| `0111` | NOR | `~(A \| B)` |

`AluOp[2]` chooses between the arithmetic and logic paths. The arithmetic path reuses one 32-bit adder: `AluOp[1]` optionally inverts `B` and also supplies the carry-in, implementing two's-complement subtraction without a separate subtractor. For the SLT operation, `AluOp[3]` selects the zero-extended most significant bit of the subtraction result. The logic path uses `AluOp[1:0]` to choose AND, OR, XOR, or NOR.

## Block diagram

![Block diagram of the 32-bit ALU arithmetic and logic paths](assets/32-bit-alu-block-diagram.png)

The diagram shows the shared adder, the four parallel bitwise operations, the arithmetic/logic result selection, and the final zero detector.

## Vivado implementation results

The supplied reports were generated with Vivado 2026.1 for the Xilinx Artix-7 `xc7a35tcpg236-1` device.

| Metric | Result |
| --- | ---: |
| Slice LUTs | 107 / 20,800 (0.51%) |
| Occupied slices | 30 / 8,150 (0.37%) |
| Slice registers | 0 |
| Block RAM tiles | 0 |
| DSP blocks | 0 |
| User I/O | 101 / 106 (95.28%) |

The 101 user I/O signals correspond exactly to 68 input bits (`A`, `B`, and `AluOp`) plus 33 output bits (`Result` and `Zero`). Because the ALU is entirely combinational, it uses no registers.

The routed timing report confirms that the 20 ns maximum-delay constraint is met:

| Timing metric | Result |
| --- | ---: |
| Worst negative slack (WNS) | 2.043 ns |
| Total negative slack (TNS) | 0.000 ns |
| Failing endpoints | 0 |
| Worst data-path delay | 17.957 ns |
| Worst path | `AluOp[1]` to `Zero` |

## Project use

Add `src/alu.v` and `src/timing.xdc` to a Vivado project and select `alu` as the top-level module. The files under `reports/` preserve the supplied post-placement and post-routing implementation results for reference.
