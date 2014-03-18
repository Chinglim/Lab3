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
#Functionality
1)Basic Moore Machine
2)Basic Mealy Machine
3)More Floors
4)Change Inputs

#Testing procedure for Moore Machine

For Moore Machine, after configuring the FPGA, the 7 segment display started off with the indicator of elevator at level 1. 
I started off testing for the 1st condition as stated in the MooreElevatorController_shell code 
"up_down equal  1  and stop =0".

The result generated is as written in VHD codes,the floor state changes to '2' on the 7 segment display. 

Then i proceed with the second conditon ,floor currently at '1', up_down= '1' and stop='1', the output on the 7-segment display is now '2', similar to the result stated in the VHD code of the Moore Machine.

I proceeded for cases when current floor is '2' and '3'. All their outputs are correct and this further verify that the Moore Elevator Control Code is correct.

Now for current floor at '4', when 'up_down=0 and stop=0', the output actually start its descent from level 4 all the way to level 1, with a slight delay between transition to each level. Whereas for other combinations , when 
"up_down=1 and stop =0","up_down=0 and stop=1" and "up_down=1 and stop=1" the output level on the 7-Segment display output 4. This verified that the Moore Code VHD file is true and its opertion meets the required functionality

Demo carried out, verified and certifyed good by CPT SLIVA.

#Testing procedure for Mealy Machine 

For Mealy Machine, i decided to demonstrate it together with the Moore Code added on and display it.

The Mealy Machine stop, reset and up_down are all of the same switches, as those used previously by the Moore Machine.

Additional signal-->floor_signal_1 and floor_signal_2 were created to be use as signal wires to the output port,'floor' and 'nextfloor' of the MealyElevatorControl.vhd codes

As similar to the testing of the Moore Machine. I tried out all the cases as stated on the Mealy and Moore ElevatorController VHD code.It turns out all well. it was then further verified and certified good by CPT SILVA.

#Testing procedure for B functionality (More floors)  

For more floors, we are tasked to display the first 8 prime numbered floors on the 7 segment display

Additional floor_state  conditions were added to the MooreElevatorPrimenumber_shell.vhd codes. As seen below, will be the similar codes for floor5 till floor7

when floor5 =>
        if (up_down='1' and stop='0') then 
                floor_state <=floor6;
        elsif (up_down='0' and stop='0') then 
                floor_state <=floor4;
        else
                floor_state <=floor5; 	
        end if;
					
then floor8 codes are then also added as shown below.				

when floor8 =>
	if (up_down='0' and stop='0') then 
	   floor_state <=floor7;
      else
	   floor_state <=floor8; 	
    end if;
    
floordigit1 and floordigit2 was then used to symbolise the first and second 7 segment display from the right.

floordigit1 will target on displaying 1, 2, 3, 5, 7 ,9, while floordigit2 will target on displaying the tenth digit, either one of two for the second 7 segment display.

Testing and demo was shown and verified workable by CPT SLIVA too.

#Testing procedure for B functionality (Change inputs)
Purpose of this functionality is to iinput a three bit number, specifiying the floor to go to. Using only numbers from 0-7. The progress from level to level still steps one floor per clock edge. 

Inst_MooreElevatorChangeinputs_Shell: MooreElevatorChangeinputs_Shell PORT MAP(
		clk => ClockBus_sig(25) ,
		input =>switch(3 downto 0) ,
		floordigit2 => floor_sig_1
	);
end Behavioral;

The above code was added to allow user to use the switches for the inputs into the hardware. 

Then in the Changeinputs.vhd file , the following code was used for the respective floor states
			when floor1 =>
					if (input>"0000") then 
						floor_state <=floor2;
					--led_state <= up;
					else
						floor_state <=floor1;
					--led_state <= nothing;						
					end if;
					
			when floor2 =>
					if (input>"0001") then 
						floor_state <=floor3;
					--led_state <= up;
					elsif (input<"0001") then 
						floor_state <=floor1;
					 --led_state <= down;
					else
						floor_state <=floor2; 
				    --led_state <= nothing;							
					end if;

up till floorstate 7, this are the conditions listed when respective inputs in entered via the switches.

Running of the codes via the hardware was carried out. The display was able to count and stop at the respective user entered floor, both upwards and downwards.Demostration is carried out to Cpt Silva and verified workable and good.
