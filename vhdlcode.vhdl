library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ATM is
    Port ( clk, rst: IN std_logic;
card,pass,operation_again: IN std_logic; --Input portt
entered_password :IN std_logic_vector (2 downto 0);
menu_selection :IN std_logic_vector (1 downto 0);
deposit_out,withdraw_out,info_out,exit_cd:out std_logic

		
	);
end ATM ;

architecture Behavioral of ATM is


type sstate is (no_card,password, checkpassword ,menu,deposit,withdraw,info,another_op,exit_card);
signal current_state, next_state : sstate;

constant validpassword : STD_LOGIC_VECTOR (2 downto 0) := "101" ;

begin
	process(clk,rst) is
	  begin
		if rst ='1' then 
			current_state <= no_card ;
		elsif rising_edge(clk) then 
			current_state <= next_state ;
		end if ; 
	end process;
	




		process(current_state, card ,pass ,operation_again ,menu_selection , entered_password ) is
		  begin
		  deposit_out<='0';
		  withdraw_out<='0';
		  info_out<='0';
		  exit_cd<='0';
			case current_state is 
				when no_card  => 
					if(card = '1') then
					  next_state <= password  ;
					else 
					  next_state <= no_card ; 
					end if;
					--deposit_out<='0';
					--withdraw_out<='0';
					--info_out<='0';
					--exit_cd<='0';

				when password=> 
					if  pass='1'    then 
					  next_state <=checkpassword;
					else
					  next_state <= password ;
					end if ;
					--deposit_out<='0';
					--withdraw_out<='0';
					--info_out<='0';
					--exit_cd<='0';
					
				when checkpassword => 
					if  entered_password  = validpassword    then 
					  next_state <= menu;
					else
					  next_state <= checkpassword ;
					end if ;
					--deposit_out<='0';
					--withdraw_out<='0';
					--info_out<='0';
					--exit_cd<='0';	
					
					
					
					
					
					
				when menu=> 
					if  menu_selection="00"    then 
					  next_state <=deposit;
					elsif menu_selection="11"  then
					  next_state <=info ; 
					elsif menu_selection="10"  then
					  next_state <=withdraw ;
					else   
					   next_state <=exit_card ;
					end if ;
					--deposit_out<='0';
					--withdraw_out<='0';
					--info_out<='0';
					--exit_cd<='0';
					
					
					
				when exit_card=> 
					 next_state <=no_card;
					 
					--deposit_out<='0';
					--withdraw_out<='0';
					--info_out<='0';
					exit_cd<='1';
					
					
				when deposit=> 
					 next_state <=another_op;
					 deposit_out<='1';

				when withdraw=> 
					 next_state <=another_op;
					 withdraw_out<='1';	

				when info=> 
					 next_state <=another_op;
					 info_out<='1';

				when another_op=> 
					if  operation_again='1'    then 
					  next_state <=menu;
					else
					  next_state <= no_card ;
					  exit_cd<='1';
					end if ;	 	
					deposit_out<='0';
					withdraw_out<='0';
					info_out<='0';
					--exit_cd<='0';

				when others =>   next_state <= no_card;
			end case;			
		end process; 
	 
end architecture Behavioral;