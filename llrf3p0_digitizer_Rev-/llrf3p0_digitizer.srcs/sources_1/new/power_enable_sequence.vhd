----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:00 01/29/2019 
-- Design Name: 
-- Module Name:    power_enable_sequence - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity llrf3p0_digitizer_top is
    Port (  sysclk          : 	in std_logic;------100 MHz
		    cpu_resetn 	    : 	in std_logic;
			lmk_scl         :   out std_logic;
			lmk_sda         :   out std_logic;
			lmk_le           : out std_logic;
			lmk_sync         :   out std_logic;
			vadj_en          : out std_logic;
			set_vadj         :   out std_logic_vector(1 downto 0);
			  
			dac_dco_p		:	in std_logic;
			dac_dco_n		:	in std_logic;
			  			  	  
--			  adc_dclk_p	:	in std_logic;
--			  adc_dclk_n	:	in std_logic;
			  
			  
			  
--			  adc_d0a_p		:	in std_logic;
--			  adc_d0a_n		:	in std_logic;
--			  adc_d1a_p		:	in std_logic;
--			  adc_d1a_n		:	in std_logic;
			  
--			  adc_d0c_p		:	in std_logic;
--			  adc_d0c_n		:	in std_logic;
--			  adc_d1c_p		:	in std_logic;
--			  adc_d1c_n		:	in std_logic;

--			  gpio_button_0	:	in std_logic;
--			  gpio_header_0	:	in std_logic; 	
           
			  AD9781_sdo	:	in std_logic;
			  AD9781_rst	:	out std_logic;
			  AD9781_ncs	:	out std_logic;
			  AD9781_sclk	:	out std_logic;
			  AD9781_sdio	:	out std_logic;
			  
			  dac_d_p		:	out std_logic_vector(13 downto 0);
--			  dac_d12p		:	out std_logic;
--			  dac_d11p		:	out std_logic;
--			  dac_d10p		:	out std_logic;
--			  dac_d9p		:	out std_logic;
--			  dac_d8p		:	out std_logic;
--			  dac_d7p		:	out std_logic;
--			  dac_d6p		:	out std_logic;
--			  dac_d5p		:	out std_logic;
--			  dac_d4p		:	out std_logic;
--			  dac_d3p		:	out std_logic;
--			  dac_d2p		:	out std_logic;
--			  dac_d1p		:	out std_logic;
--			  dac_d0p		:	out std_logic;
			  
			 dac_d_n		:	out std_logic_vector(13 downto 0);
--			  dac_d12n		:	out std_logic;
--			  dac_d11n		:	out std_logic;
--			  dac_d10n		:	out std_logic;
--			  dac_d9n		:	out std_logic;
--			  dac_d8n		:	out std_logic;
--			  dac_d7n		:	out std_logic;
--			  dac_d6n		:	out std_logic;
--			  dac_d5n		:	out std_logic;
--			  dac_d4n		:	out std_logic;
--			  dac_d3n		:	out std_logic;
--			  dac_d2n		:	out std_logic;
--			  dac_d1n		:	out std_logic;
--			  dac_d0n		:	out std_logic;
			  
			  dac_dci_n		:	out std_logic;
			  dac_dci_p		:	out std_logic;
			  
			  
			  
			  
			  pwr_sync 		: 	out STD_LOGIC;
              pwr_en 		: 	out STD_LOGIC;
			  gpio_led	      :	out std_logic_vector(7 downto 0)
			  
			  );
end llrf3p0_digitizer_top;

architecture behavioral of llrf3p0_digitizer_top is


type reg_record is record
rst_wait_cnt	:	integer range 0 to 2**29-1;
pwr_sync		:	std_logic;
pwr_en			:	std_logic;
hb_cnt			:	unsigned(28 downto 0);
lmk_init        :   std_logic;
lmk_done        :   std_logic;
gpio_led        :   std_logic_vector(7 downto 0);
vadj_en         :   std_logic;
set_vadj        :   std_logic_vector(1 downto 0);
dac_rst         :   std_logic;
end record;

signal d,q      :   reg_record;

signal dac_dco  :   std_logic;

type dac_reg_record is record
lut_phs         :  std_logic_vector(25 downto 0);
lut_cnt         :   integer range 0 to 2096;
cos_lut         :   std_logic_vector(17 downto 0);
sin_lut         :   std_logic_vector(17 downto 0);
dac0i           :   std_logic_vector(17 downto 0);
dac0q           :   std_logic_vector(17 downto 0);
dac1i           :   std_logic_vector(17 downto 0);
dac1q           :   std_logic_vector(17 downto 0);
dac_test0        :   std_logic_vector(15 downto 0);
dac_test1        :   std_logic_vector(15 downto 0);
hb_cnt          :   unsigned(28 downto 0);
end record;

signal dacd, dacq   : dac_reg_record;
signal dac_out     :    std_logic_vector(13 downto 0);
signal dac_dci      :   std_logic;


--component ila_mp2iq_debug IS
--PORT (
--clk : IN STD_LOGIC;


--probe0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
--    probe3 : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
--); 
--end component;



 
 


begin


d.rst_wait_cnt      <=  q.rst_wait_cnt + 1 when q.rst_wait_cnt /= 2**29-1 else
                        q.rst_wait_cnt;
                        
                        
--d.pwr_sync          <=   '1';
--d.pwr_en            <=   '1';

pwr_sync            <=  q.pwr_sync;
pwr_en              <=  q.pwr_en;

AD9781_rst          <=  q.dac_rst;

                         

d.hb_cnt            <=  q.hb_cnt + 1;
--dacd.hb_cnt            <=  dacq.hb_cnt + 1;

d.gpio_led(0)       <=  q.lmk_done;
d.gpio_led(1)       <=  q.hb_cnt(25);

d.gpio_led(7 downto 2)  <=  (others =>  '0');

gpio_led            <=  q.gpio_led;


d.set_vadj          <=  "10"; ----"00"-1.2, "01"-1.8, "10"-2.5, "11"-3.3
d.vadj_en           <=  '1' when q.rst_wait_cnt = 2**25-1 else q.vadj_en;
d.pwr_en            <=  '1' when q.rst_wait_cnt = 2**25-1 else q.pwr_en;
d.pwr_sync          <=  '1' when q.rst_wait_cnt = 2**26-1 else q.pwr_sync;
d.lmk_init          <=  '1' when q.rst_wait_cnt = 2**29-1 else q.lmk_init;
d.dac_rst           <=  '0' when q.rst_wait_cnt = 2**29-1 else q.dac_rst;

vadj_en             <=  q.vadj_en;
set_vadj            <=  q.set_vadj;







process(sysclk, cpu_resetn)
begin
	if(cpu_resetn = '0') then
		q.rst_wait_cnt	<=	0;
		q.hb_cnt		<=	(others  =>  '0');
		q.pwr_sync		<=	'0';
		q.pwr_en		<=	'0';
		q.lmk_init      <=    '0';
		q.lmk_done      <=    '0'; 
		q.vadj_en       <=    '0';
		q.set_vadj       <=   (others =>  '0'); 
		q.dac_rst        <=   '1';      		
	elsif(rising_edge(sysclk)) then
		q                 <=  d;
		
	end if;
end process;


--lmk_inst: entity work. lmk03328_i2c
--    port map(clock      =>     sysclk,
--	       reset        =>     cpu_resetn,   
--	       init_config	=>     q.lmk_init,	
--	       sda			=>     lmk_sda,  
--	       scl			=>     lmk_scl,  
--	       clk_done		=>     d.lmk_done
--	       );


lmk04808_inst: entity work. lmk04808

port map(clock          =>  sysclk,
		  reset			=>  cpu_resetn,
		
		  lmkinit        => q.lmk_init,   	
		  datauwire       =>   lmk_sda,	      
		  clkuwire		  =>   lmk_scl,    
		  leuwire		  =>   lmk_le, 
		
		  sync			  =>   lmk_sync,
		  pll_rst		  => d.lmk_done
		
		  );

	       
	       
	       
	       
------------initializing dac (ad9781)
ad9781_inst: entity work.ad9781
port map(clock		=>	sysclk,
			reset		=>	cpu_resetn,
		
			spi_init	=>	q.lmk_done,
--			sdo		=>	ad9781_sdo,		
			nCS		=>	ad9781_ncs,
			sclk		=>	ad9781_sclk,		
			sdio		=>	ad9781_sdio,		
			spi_done	=>	open
			);	       
	       
	       
	       
------------------mp2iq cordic for generating sine and cosine for dac------------------

 IBUFDS_inst : IBUFDS
   generic map (
      DIFF_TERM => TRUE, -- Differential Termination 
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD => "DEFAULT")
   port map (
      O => dac_dco,  -- Buffer output
      I => dac_dco_p,  -- Diff_p buffer input (connect directly to top-level port)
      IB => dac_dco_n -- Diff_n buffer input (connect directly to top-level port)
   );





process(dac_dco)
begin
    if(rising_edge(dac_dco)) then
        if(cpu_resetn = '0') then
            dacq.lut_phs    <=  (others =>  '0');
            dacq.cos_lut    <=  (others =>  '0');
            dacq.sin_lut    <=  (others =>  '0');
            dacq.lut_cnt    <=  0;
            dacq.dac0i      <=  (others =>  '0');
            dacq.dac0q     <=  (others =>  '0');
            dacq.dac1i      <=  (others =>  '0');
            dacq.dac1q      <=  (others =>  '0');
            dacq.dac_test0  <=  (others =>  '0');
            dacq.dac_test1  <=  (others =>  '0');
 --           dacq.hb_cnt     <=  (others =>  '0');
         else
            dacq            <=  dacd;
         end if;
     end if;    
end process;     
           
dacd.dac0i		<=	"01"&x"ffff";-----------this is full scale for dac
dacd.dac0q		<=	"00"&x"0000";

dacd.dac1i		<=	"00"&x"ffff";-----------half of full scale for dac
dacd.dac1q		<=	"00"&x"0000";


--iqdac_inst0: entity work.iq_mod
--port map(clock			=>	dac_dco,
--			reset			=>	'1',
--			i_in			=>	dacq.dac0i,
--			q_in			=>	dacq.dac0q,
--			tx_ena		=>	'1',
--			dac_out		=>	dacd.dac_test0,
--			rf_tx_ena	=>	open
--			);

--iqdac_inst1: entity work.iq_mod
--port map(clock			=>	dac_dco,
--			reset			=>	'1',
--			i_in			=>	dacq.dac1i,
--			q_in			=>	dacq.dac1q,
--			tx_ena		=>	'1',
--			dac_out		=>	dacd.dac_test1,
--			rf_tx_ena	=>	open
--			);



       



dac_lut_cordic: entity work.mp2iq
port map(clock		=>	dac_dco,
			reset 	=>	'1',
			load		=>	'1',
			mag 		=>	"01"&x"ffff",
			phs_h		=>	dacq.lut_phs(25 downto 8),	  
			phs_l		=>	dacq.lut_phs(7 downto 0),
			i 			=>	dacd.cos_lut,
			q 			=>	dacd.sin_lut
			);
			
-----phase needs to be adjusted to generate a specific frequency
-----with a dac clock of 241.8 MHz, 197 MHz can be generated by spinning the phase at (197/241.8)*360 = 293.3002481
-----this phase needs to be converted to counts with 26 bit full scale 293.3002481 * (2^26/360)	= 54675129
-----look up table/phase counter repeats 197/241.8 = 1970/2418 = 985/1209, every 1209 .....0 to 1208

-----with a dac clock of 186 MHz, 70 MHz can be generated by spinning the phase at (70/186)*360 = 135.483871
-----this phase needs to be converted to counts with 26 bit full scale 135.483871 * (2^26/360)	= 25256024
-----look up table/phase counter repeats 70/186 = 35/93 , every 93 .....0 to 92

-----with a dac clock of 186 MHz, 11 MHz can be generated by spinning the phase at (11/186)*360 = 21.29032258
-----this phase needs to be converted to counts with 26 bit full scale 21.29032258 * (2^26/360)	= 3968804
-----look up table/phase counter repeats 11/186 , every 186 .....0 to 185

		
--dacd.lut_phs	<=	(others	=>	'0') when dacq.lut_cnt = 185 else std_logic_vector(unsigned(dacq.lut_phs) + 3968804);--------11 MHz
dacd.lut_phs	<=	(others	=>	'0') when dacq.lut_cnt = 24 else std_logic_vector(unsigned(dacq.lut_phs) + 18790482);--------197 MHz
--dacd.lut_phs	<=	(others	=>	'0') when dacq.lut_cnt = 92 else std_logic_vector(unsigned(dacq.lut_phs) + 25256024);--------70 MHz
dacd.lut_cnt	<=	0 when dacq.lut_cnt = 24 else dacq.lut_cnt + 1;




--ila_debug_u1: ila_mp2iq_debug
--port map (
--clk =>  dac_dco,


--probe0 =>  dacq.cos_lut,
--    probe1 =>   dacq.sin_lut,
--    probe2 =>  (others  =>  '0') ,
--    probe3 => (others   =>  '0')
--); 



noniq_dac_186mhz_inst0: entity work.noniq_dac186MHz
port map(clock		=>	dac_dco,
			reset		=>	'1',
			tx_en		=> '1',
			i_in		=> dacq.dac0i(17 downto 2),
			q_in		=> dacq.dac0q(17 downto 2),
			sin_lut	=>	dacq.sin_lut,
			cos_lut	=>	dacq.cos_lut,
			d_out		=> dacd.dac_test0
			);
			
dacd.dac_test1  <=  (others =>  '0');			
--noniq_dac_186mhz_inst1: entity work.noniq_dac186MHz
--port map(clock		=>	dac_dco,
--			reset		=>	cpu_resetn,
--			tx_en		=> '1',
--			i_in		=> dacq.dac1i(17 downto 2),
--			q_in		=> dacq.dac1q(17 downto 2),
--			sin_lut  	=>	dacq.sin_lut,
--			cos_lut  	=>	dacq.cos_lut,
--			d_out		=> dacd.dac_test1
--			);
			
ODDR_inst_gen_i: for i in 0 to 13 generate			
  ODDR_inst : ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => dac_out(i),   -- 1-bit DDR output
      C => dac_dco,    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => dacq.dac_test0(i+2),  -- 1-bit data input (positive edge)
      D2 => dacq.dac_test1(i+2),  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
   );
 OBUFDS_inst_dac_i : OBUFDS
   generic map (
      IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
      SLEW => "FAST")          -- Specify the output slew rate
   port map (
      O => dac_d_p(i),     -- Diff_p output (connect directly to top-level port)
      OB => dac_d_n(i),   -- Diff_n output (connect directly to top-level port)
      I => dac_out(i)      -- Buffer input 
   );  			
end generate;

 ODDR_inst_dci : ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => dac_dci,   -- 1-bit DDR output
      C => dac_dco,    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => '1',  -- 1-bit data input (positive edge)
      D2 => '0',  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
   );			   
					       
 OBUFDS_inst_dci : OBUFDS
   generic map (
      IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
      SLEW => "FAST")          -- Specify the output slew rate
   port map (
      O => dac_dci_p,     -- Diff_p output (connect directly to top-level port)
      OB => dac_dci_n,   -- Diff_n output (connect directly to top-level port)
      I => dac_dci      -- Buffer input 
   );




end architecture behavioral;