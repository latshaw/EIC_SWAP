library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iq_mod is
port(clock		: in std_logic;
	  reset		: in std_logic;
	  i_in		: in std_logic_vector(15 downto 0);
	  q_in		: in std_logic_vector(15 downto 0);
	  tx_ena	: in std_logic;
	  dac_out	: out std_logic_vector(15 downto 0);
	  rf_tx_ena	: out std_logic
	  );
end entity iq_mod;
architecture behavior of iq_mod is
signal i_in_q       :   std_logic_vector(15 downto 0);
signal q_in_q       :   std_logic_vector(15 downto 0);
signal iq_count		: 	integer range 0 to 3;
signal iq_count_d	:	integer range 0 to 3;
signal dac_drv_in	: 	std_logic_vector(15 downto 0);
signal dac_drv_out	: 	std_logic_vector(15 downto 0);

signal ipos         :   std_logic_vector(15 downto 0);
signal ineg         :   std_logic_vector(15 downto 0);
signal qpos         :   std_logic_vector(15 downto 0);
signal qneg         :   std_logic_vector(15 downto 0);

signal ipos_q         :   std_logic_vector(15 downto 0);
signal ineg_q         :   std_logic_vector(15 downto 0);
signal qpos_q         :   std_logic_vector(15 downto 0);
signal qneg_q         :   std_logic_vector(15 downto 0);

signal dac_out_d        :   std_logic_vector(15 downto 0);
signal dac_out_q        :   std_logic_vector(15 downto 0);



begin
iq_count_d		<=	0 when iq_count = 3 else iq_count + 1;

ipos(15)        <=  not i_in_q(15);
ipos(14 downto 0)   <=  i_in_q(14 downto 0);

qpos(15)        <=  not q_in_q(15);
qpos(14 downto 0)   <=  q_in_q(14 downto 0);


ineg(15)        <=  i_in_q(15);
ineg(14 downto 0)   <=  not i_in_q(14 downto 0);

qneg(15)        <=  q_in_q(15);
qneg(14 downto 0)   <=  not q_in_q(14 downto 0);

with iq_count select
dac_drv_in	<=   	qpos_q when 1,----q+
					 ineg_q when 2, ----i-
					 qneg_q when 3,----q-
					 ipos_q when others;--i+
	
--dac_drv_in	<= i_in when iq_count = "00" else----i+
--					q_in when iq_count = "01" else----q+
--					not i_in when iq_count = "10" else ----i-
--					not q_in;----q-		

	
dac_out_d 		<= dac_drv_out when tx_ena = '1' else x"8000";
dac_out         <=  dac_out_q;
--rf_tx_ena	<= not tx_ena;
process(clock)
begin
	if(rising_edge(clock)) then
	   if(reset = '0') then
           i_in_q      <=  (others =>  '0');
           q_in_q      <=  (others =>  '0');
           ipos_q      <=  (others =>  '0');
           qpos_q      <=  (others =>  '0');
           ineg_q      <=  (others =>  '0');
           qneg_q      <=  (others =>  '0');
            iq_count	<=	0;            
            dac_out_q     <=  (others =>  '0');
            dac_drv_out	<=	(others	=>	'0');
            rf_tx_ena   <=  '1';		
	   else
           i_in_q      <=  i_in;
           q_in_q      <=  q_in;
           ipos_q      <=  ipos;
           qpos_q      <=  qpos;
           ineg_q      <=  ineg;
           qneg_q      <=  qneg;
            iq_count	<=	iq_count_d;
            dac_drv_out	<=	dac_drv_in;
            dac_out_q     <=  dac_out_d;            
            rf_tx_ena   <=  not tx_ena;		
	  end if;	
	end if;
end process;

end architecture behavior;
