LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY testb IS
END testb;
 
ARCHITECTURE behavior OF  testb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ATM
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
		 card:IN  std_logic;
         pass: IN  std_logic;
		    operation_again :IN  std_logic;
		   menu_selection  :IN  STD_LOGIC_VECTOR (1 downto 0) ;
		   entered_password :IN std_logic_vector (2 downto 0);
		 
		 deposit_out: OUT  std_logic;
		 withdraw_out  : OUT  std_logic;
		   info_out : OUT  std_logic;
		  exit_cd: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
 
   signal clk : std_logic := '0';
   signal rst : std_logic := '1' ;
   signal card : std_logic := '0' ;
 signal pass : std_logic := '0'   ;
signal operation_again :std_logic:= '0'   ;

 signal menu_selection :STD_LOGIC_VECTOR (1 downto 0):= "00" ;
signal entered_password :STD_LOGIC_VECTOR (2 downto 0):= "000" ;

--Outputs
   signal deposit_out  : std_logic;
   signal withdraw_out : std_logic;
   signal info_out : std_logic;
   signal exit_cd: std_logic;


   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ATM PORT MAP (
          
          clk => clk,
          rst => rst,
         card => card ,
		  pass =>pass ,
		   operation_again => operation_again ,
		   menu_selection =>menu_selection ,
		   entered_password => entered_password ,
		   
		   deposit_out=>deposit_out ,
		   withdraw_out=>withdraw_out ,
		   info_out=>info_out ,
		   exit_cd  =>exit_cd  
		   
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	  
REPORT "Test Case1  Withdraw test" ;
	  
      wait for 3 ns;	
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;

--ASSERT exit_cd = '0'  REPORT "error the card didnot enter"		;
	-- pass	
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;
		
 
 -- check
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
	  entered_password <= "101" ;
-- menu	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "10" ;
	  entered_password <= "101" ;
   
-- withdraw	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "10" ;
	  entered_password <= "101" ;
	  
ASSERT withdraw_out = '1'  REPORT "error in money exit"	  ;


-- another operation	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '0'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "10" ;
 entered_password <= "000" ;
 
 REPORT " END CASE 1" ;

 
 REPORT "Test Case2  Balance information" ; 
 
 
  	wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;

--ASSERT exit_cd = '0'  REPORT "error the card didnot enter"		;
		
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;
		
 
 -- menu
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
	  entered_password <= "101" ;
	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "11" ;
	  entered_password <= "101" ;
   
-- information	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "11" ;
	  entered_password <= "101" ;
	  
ASSERT info_out = '1'  REPORT "error in information"	  ;


-- another operation	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '0'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "10" ;
 entered_password <= "000" ;
  REPORT " END CASE 2" ;

 
 
 REPORT "Test Case3  Deposit information" ; 
 
 
  	wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;

--ASSERT exit_cd = '0'  REPORT "error the card didnot enter"		;
		
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
		entered_password <= "000" ;
		
 
 -- menu
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
	  entered_password <= "101" ;
--	deposit  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
	  entered_password <= "101" ;
   
-- information	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '1'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
	  entered_password <= "101" ;
	  
ASSERT deposit_out = '1'  REPORT "error in information"	  ;


-- another operation	  
		wait for 10 ns ;
		rst <= '0' ;
		card  <= '1'    ;
		pass <= '0'   ;
		operation_again <= '0'   ;
		menu_selection <= "00" ;
 entered_password <= "000" ;
 
  REPORT " END CASE 3" ;


      wait ;
   end process;

END;