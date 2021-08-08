library ieee;

use ieee.std_logic_1164.all;
entity detector1010 is 
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end entity;


architecture bh of detector1010 is 

type states is (idle,s1,s2,s3);
signal Present_state,Next_state:states;
 
begin 
P_reg:    process (clk)

        begin 
        if rising_edge(clk) then 

        Present_state<=Next_state;
        end if;

    end process;






P_states:process (input,Present_state)

        begin 
                case Present_state is 

                        when idle => if input ='0' then 
                                        Next_state<=s1;
                                    elsif input='1' then
                                        Next_state<=idle;
                                    end if;
                        when s1 => if input ='0' then 
                                        Next_state<=s1;
                                    elsif input='1' then
                                        Next_state<=s2;
                                    end if;
                        when s2 => if input ='0' then 
                                        Next_state<=s3;
                                    elsif input='1' then
                                        Next_state<=idle;
                                    end if;
                        when s3 => if input ='0' then 
                                        Next_state<=s1;
                                    elsif input='1' then
                                        Next_state<=idle;
                                    end if;
                end case;

        end process;

P_output: process (Present_state,input)
        begin
            case present_state is

                    when idle => output<='0';
                    when s1 => output<='0';
                    when s2 => output<='0';
                    when s3=>  if input ='0' then 
				    
				                 output<='0';
				               elsif input='1' then 
	                
				                 output<='1';					
				                end if;
            end case;

        end process;




end bh;
