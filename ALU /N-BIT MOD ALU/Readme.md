Title :-N-Bit parameterised Modular ALU

Overview:-
=>Designed a parameterized N-bit Arithmetic Logic Unit (ALU) in Verilog supporting arithmetic, logical, shift, compare operations. The design includes status flags and integrates an external N-bit comparator module to carry out comparison .

Features:-
=>Parameterized bit width (N)
=>Arithmetic: ADD, SUB, MUL, DIV
=>Logical: AND, OR, XOR
=>Shift: Left, Right, Arithmetic Right Shift
=>Comparator outputs: L-Less than, Equal to, G-Greater than
=>Flags: Carry, Zero, Sign, Overflow
=>Division-by-zero handling


About the Module:-
| Signal   | Width | Description                              |
| -------- | ----: | ---------------------------------------- |
| A        |     N | Operand A                                |
| B        |     N | Operand B                                |
| op_main  |     2 | Selects Arithmetic/Logical/Shift/Compare |
| op_ar    |     2 | Arithmetic sub-operation                 |
| op_log   |     2 | Logical sub-operation                    |
| op_shift |     2 | Shift sub-operation                      |
| Result   |     N | ALU result                               |
| C        |     1 | Carry/Borrow flag                        |
| Z        |     1 | Zero flag                                |
| S        |     1 | Sign flag                                |
| V        |     1 | Overflow flag                            |
| L, E, G  |     1 | Comparator outputs                       |

Operation Tables:-
Main operation
| op_main | Category   |
| ------- | ---------- |
| 00      | Arithmetic |
| 01      | Logical    |      //Carries out the main operation selection.
| 10      | Shift      |
| 11      | Compare    |

Arithmetic Operation
| op_ar | Operation |
| ----- | --------- |
| 00    | ADD       |    //Carries out the sub operation under arithmetic.
| 01    | SUB       |
| 10    | MUL       |
| 11    | DIV       |

| op_log | Operation |
| ------ | --------- |
| 00     | AND       |       //Carries out the sub operation under logical.
| 01     | OR        |   
| 10     | XOR       |
| 11     | XX(No op) |        

| op_shift | Operation              |
| -------- | ---------------------- |   //Carries out the sub operation under shifting
| 00       | Left Shift             |
| 01       | Right Shift            |
| 10       | Arithmetic Right Shift |
| 11       | XX(No op)              |

=>When op_main= 11 ,comparison is carried out and respectively the output bits for it behave

Design Methodology:-
=>The first step was to define the functional requirements of the ALU. The design was required to support four major categories of operations:

Arithmetic Operations: Addition, Subtraction, Multiplication, and Division
Logical Operations: AND, OR, and XOR
Shift Operations: Left Shift, Right Shift, and Arithmetic Right Shift
Comparison Operations: Less Than, Equal To, and Greater Than
In addition to these operations, the ALU was required to generate standard status flags:
Carry (C)
Zero (Z)
Sign (S)
Overflow (V)
The design also had to be parameterized so that the same module could be reused for different bit widths by changing a single parameter N.

=>Architectural Planning
Before coding, the overall architecture of the ALU was planned. A hierarchical control structure was chosen using one main operation selector (op_main) and separate sub-operation selectors for arithmetic, logical, and shift operations.
This modular selection scheme simplified the design and made it easy to add new operations in the future.
The comparator functionality was implemented as a separate N-bit comparator module and instantiated within the ALU to promote code reuse and modularity.


=>Pseudocode Development
A detailed pseudocode representation was created before implementation. The pseudocode used nested case statements to map each control signal combination to the corresponding operation.
This step helped verify the logic flow and reduced coding errors during implementation.

=>External Modular Comparator Integration
Instead of embedding comparison logic directly into the ALU, a dedicated N-bit comparator module was developed separately and instantiated in the design. This provided three outputs:
Less Than (L)
Equal To (E)
Greater Than (G)
This modular approach improved maintainability and allowed the comparator to be reused independently.


=>Verification and Testing
A comprehensive testbench was developed to verify all supported operations and flag outputs.
The verification process included:

Testing every arithmetic, logical, and shift operation
Checking comparator outputs
Verifying flag generation
Evaluating edge cases such as overflow and division by zero
Simulation was performed using Icarus Verilog, and waveforms were analyzed using GTKWave.


=>Flag Generation
Carry (C)
Set when arithmetic produces a carry/borrow. C=1 (when carry is encountered )  else C=0 (when carry is NOT encountered)

Zero (Z)
Set when Result == 0. i.e Z=1 when result is 0

Sign (S)
Most significant bit of Result. S=1 when negative ,S=0 when positive
That is true only when interpreting the result as a signed two’s complement value.

Overflow (V)
Set when signed arithmetic exceeds the representable range.

Handled edge cases:-
=>Division by zero returns 0.
=>Overflow detection for ADD and SUB.
=>Arithmetic right shift preserves sign.

Challenges faced :-
=>I encountered issues while compiling the external comparator module together with the ALU..Which was later on resolved by using a different compile command iverilog *v.

