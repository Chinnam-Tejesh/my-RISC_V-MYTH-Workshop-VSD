# Labs Day-1 and Day-2

Documention of the labs done in the RISCV MYTH workshop during Day-1 and Day-2. containing the tools *GCC RISCV* (cross compiler) and *SPIKE RISCV* (bare metal simulator simulator), and programming languages *C* and *ASM*.

- **Index**:
    - [Lab 1](#lab-1) C program to compute sum from 1 to N.
    - [Lab 2](#lab-2) RISC-V GCC cross compile and disassembling.
    - [Lab 3](#lab-3) Spike Simulation and Debugging.
    - [Lab 4](#lab-4) min and max values of Signed and Unsigned double words.
    - [Lab 5](#lab-5) Sum 1 to N using C and ASM (understanding ABI).
- Note: the images might take time to load. 

<br>

---
---
## Lab 1 
- Title: **C program to compute sum from 1 to N.**
- Objective: to use GCC (of host) and execute a simple c program.
- Steps:
    - The C code for sum of numbers from 1 to N
    - ![sum1tN.c file](L1/L1_sum1tN.png)
    - using the gcc command, the sum1tN.c is compiled and executed.
    - ![output of sum1tN](L1/L1_terminal_sum1tN.png)

<br>

---
## Lab 2
- Title: **RISCV GCC compile and disassemble.**
- Objective: to use GCC (RISCV) for compiling and disassembling.
- Steps:
    - using the sum1tN.c file
    - ![sum1tN.c file](L2/L2_sum1tN.png)
    - the file sum1tN.c is passed to **riscv64-unkown-elf-gcc** with the flags: -march=rv64i, -mabi=lp64 and optimisation -O1
    - ![riscv gcc compile](L2/L2_RSICV_GCC_compile.png)
    - the file sum1tN.o is passed to the **riscv64-unkown-elf-objdump** with the flags: -d and | less
    - ![riscv gcc objdump terminal](L2/L2_riscv_debug_terminal.png)
    - ![riscv gcc debug main](L2/L2_RISCV_debug.png)
    - Note: the main starts from address 10184 and ends at 101B0, which gives B (11 in decimal) instructions inside the main function.

<br>

---
## Lab 3
- Title: **Spike Simulation and Debug**
- Objective: to simulate and debug a c program using spike.
- Steps:
    - using the sum1tN.c file
    - ![sum1tN.c file](L2/L2_sum1tN.png)
    - pass the file to **riscv64-unkown-elf-gcc** with the flags: -march=rv64i, -mabi=lp64, optimisation -Ofast and -o sumitN_riscv
    - run the output (sumitN_riscv) using **spike pk**
    - ![spike sim](L3/L3_spike.png)
    - Note: spike is the tool and pk flag indicates the riscv simulator, and -d flag in addition is used for debugging riscv.

<br>

---
## Lab 4
- Title: **Signed and Unsigned Numbers**
- Objective: to simulate and find out the maximum and minimum values of signed and unsigned integer.
- Steps:
    - Note: the value to variables in the programs of signed and unsigned are given as 2 power (*bit_width* * 2), that is 2 power 128. And it is way beyond 64 bits can hold.
    - C code for finding min and max values for unsigned integer:
    - ![unsigned min max](L4/unsigned_min_max.png)
    - C code for finding min and max values for signed integer:
    - ![signed min max](L4/signed_min_max.png)
    - The outputs of simulating the above c codes using **spike tool** (with flag: pk) is:
    - ![riscV signed unsigned](L4/riscV_signed_unsigned_min_max.png)

<br>

---
## Lab 5
- Title: **Sum 1 to N using ASM (understanding ABI)**
- Objective to call an asm function from C program and compute the result of sum from 1 to N.
- Steps:
    - C program calling an asm function (lable):
    - ![C progream calling asm function](L5/L5_c.png)
    - ASM program taking arguments and computing the sum from 1 to N:
    - ![ASM program computing sum 1 to N](L5/L5_asm.png)
    - Compiled C and ASM programs (using GCC RISCV cross compiler), simulated (using spike pk). for 2 N values ( 9 and 15):
    - ![compilation and simulation of C and ASM progream](L5/L5_output.png)
    - Output of Debugger (riscv64-unkown-elf-objdump with flag -d):
    - ![C main Debug riscv](L5/L5_c_debug.png)
    - ![asm Debug riscv](L5/L5_asm_debug.png)

<br>

---
## Lab 6