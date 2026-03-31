# Labs of D3 module

Documention of the labs done in the RISCV MYTH workshop module D3.

- **Index:**
    - [Lab 1](#lab-1) Combinational circuits in TL-Verilog.
    - [Lab 2](#lab-2) Sequential circuits in TL-Verilog.
    - [lab 3](#lab-3) Pipeline circuits in TL-Verilog,
- Note: the images might take time to load. 

<br>

---
---
## Lab 1
- Title: **Lab on Combinational circuits**
- Objective: use makerchip online IDE to perform the stated tasks.
- Tasks in total: 0 to 4 (5).

<br>

- **Task 0:**
    - **Objective:** To *Navigate, Setup and Recreate* the screen in makerchip online IDE.
    - Note: the lab is to focus on the error ports, and check that makerchip online IDE auto highlites all occurances everywhere.
    - ![makerchip online IDE](L1/L1_task0_Navgation_n_Setup.png)

- **Task 1:**
    - **Objective:** To write the TL-verilog code for *Logic Gates*.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip online IDE](L1/L1_task1_Gates.png)

- **Task 2:**
    - **Objective:** To write the TL-verilog code for *Vectored inputs* and *arithematic addition operator*.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip online IDE](L1/L1_task2_Vectors.png)

- **Task 3:**
    - **Objective:** To write the TL-verilog code for *Multiplexer*.
    - **Details:** inputs are of 8 bit width and 2X1 Mux.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip online IDE](L1/L1_task3_Mux.png)

- **Task 4:**
    - **Objective:** To write the TL-verilog code for *Combinational Calculator*.
    - **Details:** inputs are of 32 bitwidth, opration_select is 4 bitwidth and include internal nodes like sum, diff, prod and quot.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip online IDE](L1/L1_task4_Combinational_Calculator.png)

<br>

---
## Lab 2
- Title: **Lab on Sequential circuits**
- Objective: use makerchip online IDE to perform the stated tasks.
- Tasks in total: 0 to 2 (3).

<br>

- **Task 0:**
    - **Objective:** To write the TL-Verilog code for counter.
    - **Details:** increament the out by 1 every clock cycle.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip counter](L2/L2_task0_Counter.png)

- **Task 1:**
    - **Objective:** To write the TL-Verilog code for fibonacci series.
    - **Details:** add previous and previous-previous results, output 1 when reset is active.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip fibonacci series](L2/L2_task1_Fibanachi_series.png)

- **Task 2:**
    - **Objective:** To write the TL-Verilog code for calculator (with feedback).
    - **Details:** feed the output to the input through val1.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip calculator with feedback](L2/L2_task2_Calculator_out_to_in.png)

<br>

---
## Lab 3
- Title: **Lab on Sequential circuits (Pipelined Logic)**
- Objective: use makerchip online IDE to perform the stated tasks.
- Tasks in total: 0 to 4 (5).

<br>

- **Task 0:**
    - **Objective:** To write the TL-Verilog code for error identifier pipeline.
    - **Details:** 6 stage pipeline for identifying error.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip error pipeline](L3/L3_task0_Error_pipipeline.png)

- **Task 1:**
    - **Objective:** To write the TL-Verilog code for Calculator with counter.
    - **Details:** 32bit-width calculator and count value.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip calculator and counter](L3/L3_task1_Calculator_N_Counter.png)

- **Task 2:**
    - **Objective:** To write the TL-Verilog code for Calculator with even odd cycle oscillator.
    - **Details:** valid changes every cycle. high for odd cycle and low for even cycle.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip calculator and oscillator](L3/L3_task2_2_Cycle_Calculator_1.png)
    - ![makerchip calculator and oscillator](L3/L3_task2_2_Cycle_Calculator_2.png)

- **Task 3:**
    - **Objective:** To write the TL-Verilog code for Calculator with valid.
    - **Details:** output 0 for every odd cycle.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip calculator with valid](L3/L3_task3_Calculator_Validity_1.png)
    - ![makerchip calculator with valid](L3/L3_task3_Calculator_Validity_2.png)

- **Task 4:**
    - **Objective:** To write the TL-Verilog code for Calculator with memory.
    - **Details:** recall with $op is 3'b101 and new value when $op[2] is high.
    - Note: the alert/warning logo beside the Log is due to not assigning few variables, it is not an issue since the makerchip online IDE identifies creates an random stymulus.
    - ![makerchip calculator with mem](L3/L3_task4_Calculator_mem_1.png)
    - ![makerchip calculator with mem](L3/L3_task4_Calculator_mem_2.png)

<br>

---
## Lab 4
