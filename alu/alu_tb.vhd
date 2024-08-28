LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    COMPONENT alu IS
    PORT(
         en : IN  std_logic;
         alu_op : IN  std_logic_vector(4 downto 0);
         reg_a : IN  std_logic_vector(18 downto 0);
         reg_b : IN  std_logic_vector(18 downto 0);
         carry_out : OUT  std_logic;
         zero_flag : OUT  std_logic;
         res_out : OUT  std_logic_vector(18 downto 0)
        );
    END COMPONENT;
	 
   signal clock :  std_logic;
   signal en : std_logic := '0';
   signal alu_op : std_logic_vector(4 downto 0);
   signal reg_a : std_logic_vector(18 downto 0) := (others => '0');
   signal reg_b : std_logic_vector(18 downto 0) := (others => '0');
   signal carry_out : std_logic;
   signal zero_flag : std_logic;
   signal res_out : std_logic_vector(18 downto 0);

   constant clock_period : time := 10 ns;
 
BEGIN
 
   uut: alu PORT MAP (
          en => en,
          alu_op => alu_op,
          reg_a => reg_a,
          reg_b => reg_b,
          carry_out => carry_out,
          zero_flag => zero_flag,
          res_out => res_out
        );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

 stim_proc: process
   begin			
	
		reg_a <= (others => '1');
		reg_b <= "0000000000000000001";
		
		alu_op <= "00000";
		en <= '0';
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00001";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00010";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00011";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00100";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00101";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00110";
		wait for clock_period*10;
		en <= '1';
		
		wait for clock_period*10;
		
		en <= '0';
		alu_op <= "00111";
		wait for clock_period*10;
		en <= '1';
		
      wait;
   end process;

END;
