library ieee;

use ieee.std_logic_1164.all;
entity detector11011 is 
port (
	clk	:in  std_logic;
	input	:in std_logic;
	output	:out std_logic);
end entity;


architecture bh of detector11011 is 

type states is (idle,s1,s2,s3,s4);
signal state:states;
 
begin 

process (clk)

begin 

if rising_edge (clk) then 
case state is 

        when idle => if input ='0' then 
                        state<=idle;
                        output<='0';
                    elsif input='1' then
                        state<=s1;
                        output<='0';
                    end if;
        when s1 => if input ='0' then 
                        state<=idle;
                        output<='0';
                    elsif input='1' then
                        state<=s2;
                        output<='0';
                    end if;
        when s2 => if input ='0' then 
                        state<=s3;
                        output<='0';
                    elsif input='1' then
                        state<=s2;
                        output<='0';
                    end if;
        when s3 => if input ='0' then 
                        state<=idle;
                        output<='0';
                    elsif input='1' then
                        state<=s4;
                        output<='0';
                    end if;
        when s4=> if input ='0' then 
                        state<=idle;
                        output<='0';
                    elsif input='1' then
                        state<=idle;
                        output<='1';
                    end if;

end case;
end if;
end process;




end bh;
