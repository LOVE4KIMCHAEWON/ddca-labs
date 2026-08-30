# Lab 01 — Digital Comparators

## Objectives

- Build and verify a 1-bit magnitude comparator.
- Recreate the comparator using NAND gates only.
- Extend bitwise equality comparison to a 4-bit input.

## Exercise 1 — 1-bit comparator

For one-bit inputs `A` and `B`, the three outputs are:

| Condition | Boolean expression |
| --- | --- |
| `A > B` | `A · B̅` |
| `A = B` | `A XNOR B` |
| `A < B` | `A̅ · B` |

The screenshots below demonstrate each active output.

### A is greater than B

![1-bit comparator with A greater than B](Comparator/Comparator%28A%20is%20bigger%20than%20B%29.png)

### A is equal to B

![1-bit comparator with A equal to B](Comparator/Comparator%28A%20is%20equal%20B%29.png)

### A is less than B

![1-bit comparator with A less than B](Comparator/Comparator%28A%20is%20less%20than%20B%29.png)

## Exercise 2 — NAND-only comparator

The comparator functions are rebuilt using NAND gates, demonstrating the functional completeness of NAND logic.

![Comparator implemented with NAND gates only](Comparator%28only%20nand%20gate%29/Comparator%28only%20nand%20gate%29.png)

## Exercise 3 — 4-bit equality comparator

Each corresponding bit pair is compared with XNOR. The four equality results are then combined with AND gates, so the final output is high only when all four bit pairs match.

![4-bit equality comparator](4-bit%20Comparator%20Circuit/4-bit%20Comparator%20Circuit.png)

## Result

The circuits demonstrate single-bit magnitude comparison, an equivalent NAND-only implementation, and multi-bit equality comparison through repeated bitwise stages.

