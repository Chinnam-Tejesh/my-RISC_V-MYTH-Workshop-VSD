# Labs

Documention of the labs done in the workshop.

<br>

---
## Lab 1 
- Title: **c program to compute sum from 1 to N.**
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
- Objective: to simulate and debug a c program using spike
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