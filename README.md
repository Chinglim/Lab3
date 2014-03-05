Lab3
====
(Prelab)

Inputs: 1) clk_50m is the input for the Clock-Divider component
        2) clk-50m is also the clk input for the nexys2_sseg component
        3) switch should be the one to connect to the nibble_to_seg to switch value  of the nibble to output the 8 bits sseg_sig

Outputs:1)Clockbus is the output of the Clock_Divider component 
        2)Clockbus will the be connected to the 8 bits LED output
        3The SSEG_AN is a 4 bit output that is the select signal.
        4)SSEG is another 8 bit output that send information away from the chip.

The purpose of the nibble is to output a display on the 8 bits  numbers segment display, using a binary input value. For example, if a 4 bits 0010 is going to be the nibble input, the nibble_to_seg component will process that input and proceed to output the equivalent decimal value '2' on the 8 bits  number segment display.

The pupose of the "Clock_Divider" is to provide a certain amount of frequency to the 27 bits "Clockbus_signal" With the decrease in the signal frequency, the longer it will take for the respective bits, from LSB to MSB, to carry out a state change.

As the second bits will wait for 2^N state change of the LSB before it carries out a state change. This also applies for the subsequent  higher number of bits up to the MSB.  

This will  also result in a more visible LED display of the respective state change each time.

