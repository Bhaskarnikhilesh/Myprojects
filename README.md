# Myprojects#  `2-bit by 3-bit Multiplier Assessment` 

This repository is where you will develop a 2-bit by 3-bit Multiplier

The following files are provide

| File | Purpose |
| ---  | --- |
| `Multiplier2x3.v`         | Main Module for 2bit x 3bit Multiplier |
| `MultiplerFirstRow.v`     | Submodule which comprises first row of multiplier |
| `MultiplerRemainingRow.v` | Submodule which comprises remaining rows of multiplier |
| `Multiplier2x3.sdc`       | Generic timing constraints file |
| `Structure/*`             | Diagrams of the multiplier structure |


## `Structure` folder

This folder contains diagrams of the RTL viewer and the flow verilog gate level RTL viewer diagrams of the Multiplier 2bit x 3bit.  



## `Adder1Bit.v` file

This is the file taken from [github resources](https://github.com/leeds-embedded-systems/ELEC5566M-Unit1-Nikhilesh-Bhaskar/tree/main).  





## `Multilpier2x3_tb.v` file 

This file is where the test bench which provides stimulus to the Multiplier2x3 module 

Explanation:

Here timescale directive is set to give delay of 0.1 ns so we have given for 1 unit and for smallest sub-unit delay is 100 ps so 
we get 0.1ns delay to the simulator.

we have declared inputs and outputs as m,q and p 
instantiated the Multiplier2x3 and created an exhaustive for loops for all the combination m and q for the 32 possible inputs.





## `Multiplier2x3.v` file 

This is the main module for 2bit x 3bit Multiplier

Explanation:

Here m and q are declared as the inputs with 2 and 3 bits respectively and p module as the output with 5 bits in main module  
Multiplier2x3.

Declared c output, m output, q output and s output as a wire did and operation. 

i.   Performed first row first submodule by instantiating from MultiplierFirstRow.v file
ii.  Performed first row second submodule by instantiating from MultiplierFirstRow.v file
iii. Performed Second row first submodule by instantiating from MultiplierRemainingRow.v file 
iv.  Performed Second row second submodule by instantiating from MultiplierRemainingRow.v file
v.   assigning p4 output which is coming from cout of second row submodule 2.





## `MultiplierFirstRow.v` file

This is the file where we created verilog HDL code for Figure 2.2: Submodule for First Row of Multiplier given in the task sheet.

Explanation:

Declared m, q, cIn as the inputs which takes 2bits for m, q and outputs as qOut, cOut mOut and s.

i.   Did AND operation for q[1] and m[0] as inputs and stored wire A according to the Figure 2.2.
ii.  Did AND operation for q[0] and m[1] as inputs and output as wire B according to the Figure 2.2.
iii. assigning qOut[0] = 1'b0; qOut[1] = q[1]; assign mOut = m[0]; according to the Figure 2.2.
iv.  Performing full 1 bit adder by instantiating 1 bit full adder provided from [Adder1Bit.v](https://github.com/leeds-embedded-systems/ELEC5566M-Unit1-Nikhilesh-Bhaskar/tree/main) by giving A, B, cIn as inputs and s, cOut as outputs.





## `MultiplierRemainingRow.v` file

This is the file where we created verilog HDL code for Figure 2.3: Submodule for Remaining Rows of Multiplier given task sheet.

Explanation:

Declared pp, m, q, cIn as the inputs and outputs as qOut, cOut, mOut and s.

i.   assigned mOut = m; qOut = q; so that we can instantiate directly these are output coming from q and m.
ii.  Performing AND operation by giving q, m as inputs and wire A as the output.
iii. iv.  Performing full 1 bit adder by instantiating 1 bit full adder provided from [Adder1Bit.v](https://github.com/leeds-embedded-systems/ELEC5566M-Unit1-Nikhilesh-Bhaskar/tree/main) by giving wire A, pp, cIn as inputs and s, cOut as outputs.