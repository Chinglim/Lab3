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
