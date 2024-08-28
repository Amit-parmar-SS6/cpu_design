LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY pc_tb IS
END pc_tb;
 
ARCHITECTURE behavior OF pc_tb IS 
  
    COMPONENT pc
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         oe : IN  std_logic;
         ld_pc : IN  std_logic;
         input_pc : IN  std_logic_vector(7 downto 0);
         output_pc : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
   
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal oe : std_logic := '0';
   signal ld_pc : std_logic := '0';
   signal input_pc : std_logic_vector(7 downto 0) := (others => '0');

   signal output_pc : std_logic_vector(7 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: pc PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          oe => oe,
          ld_pc => ld_pc,
          input_pc => input_pc,
          output_pc => output_pc
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
    
      wait for 100 ns;	
		
		rst <= '0';
		en <= '0';
		ld_pc <= '0';

      wait for clk_period*10;
		
		en <= '1';
	
      wait for clk_period*10;
		
		en <= '0';
		oe <= '1';

      wait for clk_period*10;
		
		oe <= '0';
		rst <= '1';

      wait for clk_period*10;
     
	  	en <= '1';
		rst <= '0';
		
		wait for clk_period*10;
		
		oe <= '0';
		
      wait;
   end process;

END;
