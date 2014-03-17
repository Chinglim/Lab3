----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		CE3
-- Module Name:    	MooreElevatorController_Shell - Behavioral 
-- Description: 		Shell for completing CE3
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MooreElevatorChangeinputs_Shell is
    Port ( clk : in  STD_LOGIC;
           input:STD_LOGIC_VECTOR (3 downto 0);
           floordigit2 : out  STD_LOGIC_VECTOR (3 downto 0)
			  --ledoutput: out STD_logic_vector (3 downto 0 )
			  );

end MooreElevatorChangeinputs_Shell;

architecture Behavioral of MooreElevatorChangeinputs_Shell is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type floor_state_type is (floor1, floor2, floor3, floor4, floor5, floor6,floor7,floor8);
type led_state_type is (up, down, nothing);


--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal floor_state : floor_state_type;
--signal led_state : led_state_type;


begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
floor_state_machine: process(clk)
begin
	--clk'event and clk='1' is VHDL-speak for a rising edge
	if (clk'event and clk='1') then
	
		case floor_state is
				--when our current state is floor1--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
			
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
		
			when floor3 =>
					if (input> "0010") then 
						floor_state <=floor4;
					 --led_state <= up;						
					elsif (input<"0010") then 
						floor_state <=floor2;
				    --led_state <= down;
					else
						floor_state <=floor3; 
					 --led_state <= nothing;						
					end if;
								
			when floor4 =>
					if (input> "0011") then 
						floor_state <=floor5;
					--led_state <= up;
					elsif (input<"0011") then 
						floor_state <=floor3;
					--led_state <= down;
					else
						floor_state <=floor4; 
					--led_state <= nothing;
					end if;
					
			when floor5 =>
					if (input>"0100") then 
						floor_state <=floor6;
					--led_state <= up;
					elsif (input<"0100") then 
						floor_state <=floor4;
					  --led_state <= down;
					else
						floor_state <=floor5;
					--led_state <= nothing;						
					end if;
					
				when floor6 =>
					if (input>"0101") then 
						floor_state <=floor7;
					--led_state <= up;
					elsif (input<"0101") then 
						floor_state <=floor5;
					--led_state <= down;
					else
						floor_state <=floor6; 
					--led_state <= nothing;						
					end if;
				
				when floor7 =>
					if (input>"0110") then 
						floor_state <=floor8;
					--led_state <= up;
					elsif (input<"0110") then 
						floor_state <=floor6;
					--led_state <= down;
					else
						floor_state <=floor7; 	
					--led_state <= nothing;
					end if;
				
				when floor8 =>
					if (input<"0111") then 
						floor_state <=floor7;
						--led_state <= up;
					else
						floor_state <=floor8;
					--led_state <= nothing;
					end if;
				--This line accounts for phantom states
				when others =>
					floor_state <= floor1;
			end case;
		end if;
end process;

-- Here you define your output logic. Finish the statements below
floordigit2 <= "0000" when (floor_state = floor1) else
					"0001" when (floor_state = floor2) else
					"0010" when (floor_state = floor3) else
					"0011" when (floor_state = floor4) else
					"0100" when (floor_state = floor5) else
					"0101" when (floor_state = floor6) else
					"0110" when (floor_state = floor7) else
					"0111" ;
			
--ledoutput <= "00" when led_state<=nothing else
--				 "01" when led_state<=down else
--				 "02" when led_state<=up ;
end Behavioral;

