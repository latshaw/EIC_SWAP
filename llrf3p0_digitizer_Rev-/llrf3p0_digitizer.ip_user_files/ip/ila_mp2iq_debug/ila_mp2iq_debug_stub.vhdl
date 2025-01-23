-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Fri Feb 16 16:00:34 2024
-- Host        : EESBACHIMAN1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/Bachiman_FDrive/Projects/LLRF_EIC/nexys_digilent_llrf/llrf3p0_digitizer/llrf3p0_digitizer.srcs/sources_1/ip/ila_mp2iq_debug/ila_mp2iq_debug_stub.vhdl
-- Design      : ila_mp2iq_debug
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_mp2iq_debug is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end ila_mp2iq_debug;

architecture stub of ila_mp2iq_debug is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[17:0],probe1[17:0],probe2[17:0],probe3[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2019.2";
begin
end;
