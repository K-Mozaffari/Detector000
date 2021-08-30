--1001

library ieee;
use ieee.std_logic_1164.all;

entity detector_1001 is 

port (
clk:in std_logic;
rst:in std_logic;
in1:in std_logic;
out1:out std_logic
);


end entity;

architecture bh of detector_1001 is 
type states is (s0,s1,s2,s3);
signal temp:std_logic:='0';

signal present_state,next_state:states;


begin 


P_dff :process (clk)

begin
if (rising_edge (clk)) then 
	present_state<=next_state;
end if;

end process P_dff;


p_next_state: process(in1,present_state)

begin
case present_state is 
		when s0 => if in1='0' then 
				next_state<=s0;
			else
				next_state<=s1;
			end if;
		when s1 => if in1='0' then 
				next_state<=s2;
			else
				next_state<=s1;
			end if; 
		when s2 => if in1='0' then 
				next_state<=s3;
			else
				next_state<=s1;
			end if; 
		when s3 => if in1='0' then 
				next_state<=s0;
			else
				next_state<=s1;
			end if;
	end case;  


end process p_next_state;
-------------------------------------------
p_present_state: process(in1,present_state)

begin
case present_state is 
		when s3 => if in1='0' then 
				temp<='0';
			else
				temp<='1';
			end if;
		when others => temp<='0' ;


	end case;  


end process p_present_state;
process (clk)


begin 
if (rising_edge(clk)) then 
out1<=temp;
end if ;

end process;
end bh;

