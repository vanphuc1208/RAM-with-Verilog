# RAM with Verilog

## General Information:
- Goal: design, validate, and synthesize a RAM memory.

## About the Project layout:
- top_ram.v: implement the PWM.
- top_ramtb.v: validate the operation of RAM using waveform and file IO(data.txt).

## About the Operation:
***Input**
- clk: clock signal from the board.
- rst: delete all the data in the RAM memory.
- wr: if the signal is 1, we write data into the memory, otherwise we read data from the memory 

***Output**
dout: the data we read from the memory.

 ## Waveform:
![image](https://github.com/vanphuc1208/RAM-with-Verilog/assets/116254695/2e0b061b-5c22-4c58-9e28-450b8bfe9a11)





