#Lab3
====
(Prelab)

Inputs: 1) clk_50m is the input for the Clock-Divider component
        2) clk-50m is also the clk input for the nexys2_sseg component
        3) switch should be the one to connect to the nibble_to_seg to switch value  of the nibble to output the 8 bits sseg_sig

Outputs:1)Clockbus is the output of the Clock_Divider component 
        2)Clockbus will the be connected to the 8 bits LED output
        3The SSEG_AN is a 4 bit output that is the select signal.
        4)SSEG is another 8 bit output that send information away from the chip.

The purpose of the nibble is to output a display on the 7 segment  number display, using a binary input value. For example, if a 4 bits 0010 is going to be the nibble input, the nibble_to_seg component will send that input to nexys2_sseg to process, before outputting the equivalent decimal value '2' on the 7 segment number display.

The pupose of the "Clock_Divider" is to provide a certain amount of frequency to the 27 bits "Clockbus_signal" With the decrease in the signal frequency, the longer it will take for the respective bits, from LSB to MSB, to carry out a state change.

As the second bits will wait for 2^N state change of the LSB before it carries out a state change. This also applies for the subsequent  higher number of bits up to the MSB.  

This will  also result in a more visible LED display of the respective state change each time.

#[Testing procedure]

For Moore Machine, after configuring the FPGA, the 7 segment display started off with the indicator of elevator at level 1. 
I started off testing for the 1st condition as stated in the MooreElevatorController_shell code 
"up_down equal  1  and stop =0".

The result generated is as written in VHD codes,the floor state changes to '2' on the 7 segment display. 

Then i proceed with the second conditon ,floor currently at '1', up_down= '1' and stop='1', the output on the 7-segment display is now '2', similar to the result stated in the VHD code of the Moore Machine.

I proceeded for cases when current floor is '2' and '3'. All their outputs are correct and this further verify that the Moore Elevator Control Code is correct.

Now for current floor at '4', when 'up_down=0 and stop=0', the output actually start its descent from level 4 all the way to level 1, with a slight delay between transition to each level. Whereas for other combinations , when 
"up_down=1 and stop =0","up_down=0 and stop=1" and "up_down=1 and stop=1" the output level on the 7-Segment display output 4. This verified that the Moore Code VHD file is true and its opertion meets the required functionality



