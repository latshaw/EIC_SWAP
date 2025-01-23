// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Feb 16 16:00:34 2024
// Host        : EESBACHIMAN1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Bachiman_FDrive/Projects/LLRF_EIC/nexys_digilent_llrf/llrf3p0_digitizer/llrf3p0_digitizer.srcs/sources_1/ip/ila_mp2iq_debug/ila_mp2iq_debug_stub.v
// Design      : ila_mp2iq_debug
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2019.2" *)
module ila_mp2iq_debug(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[17:0],probe1[17:0],probe2[17:0],probe3[17:0]" */;
  input clk;
  input [17:0]probe0;
  input [17:0]probe1;
  input [17:0]probe2;
  input [17:0]probe3;
endmodule
