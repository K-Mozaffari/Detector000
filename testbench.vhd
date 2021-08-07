library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_detector000 is 
 
end entity;


architecture bh of test_detector000 is 

component detector000   
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end component;
------------ Signal declaration -------------
signal clk:std_logic:='0';
signal input_vector:std_logic_vector(16 downto 0):="01010001111000000";
signal input,output:std_logic;
 
begin 


P_CLK: process 
        begin
        clk<=not(clk);
        wait for 100 ps;
    end process P_CLK;


gate0: detector000  port map(
	                        clk	    =>clk,--:in  std_logic;
	                        input   =>input ,--	:in std_logic;
	                        output  =>output--	:out std_logic
                            );
 


 
process (clk)

        begin 
                if falling_edge(clk) then 
                    input_vector<= std_logic_vector(shift_right(unsigned(input_vector),1) );
                    input<=input_vector(0);
                end if;

end process;




end bh;
