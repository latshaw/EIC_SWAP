#Define clocks, lmk_clk_p/n is not on a clock pin
create_clock -name sys_clk -period 10.000 [get_ports { sysclk }]
create_clock -name dac_clk -period 4.000 [get_ports { dac_dco_p }]
#create_clock -name clock   -period 10.606 [get_ports { lmk_clk_p }]
#set_property CLOCK_DEDICATED_ROUTE FALSE  [get_nets clock]

# Power
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS25 DRIVE 12 SLEW SLOW } [get_ports { pwr_sync }]
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS25 DRIVE 12 SLEW SLOW } [get_ports { pwr_en }]



# Clock, Reset and LED
set_property -dict { PACKAGE_PIN R4 IOSTANDARD LVCMOS33 } [get_ports { sysclk }]
set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS15 } [get_ports { cpu_resetn }]

set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[0] }]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[1] }]
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[2] }]
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[3] }]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[4] }]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[5] }]
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[6] }]
set_property -dict { PACKAGE_PIN Y13 IOSTANDARD LVCMOS25 } [get_ports { gpio_led[7] }]

set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVCMOS25} [get_ports {set_vadj[0]}]
set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVCMOS25} [get_ports {set_vadj[1]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS25} [get_ports vadj_en]




#set_property -dict { PACKAGE_PIN F10 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { sys_clk_n }]
#set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { kintex_data_in_p }]
#set_property -dict { PACKAGE_PIN H13 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { kintex_data_in_n }]
#set_property -dict { PACKAGE_PIN J11 IOSTANDARD LVDS_25 } [get_ports { kintex_data_out_p }]
#set_property -dict { PACKAGE_PIN J10 IOSTANDARD LVDS_25 } [get_ports { kintex_data_out_n }]

# Shared SPI (sdi: lmk01801, ad9781) (sclk: lmk01801, ad9653, ad9781)
set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { lmk_sda }]
set_property -dict { PACKAGE_PIN L20 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { lmk_scl }]

set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS25} [get_ports { AD9781_sdo }]
set_property -dict { PACKAGE_PIN L15 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { AD9781_rst }]
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { AD9781_ncs }]
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { AD9781_sclk }]
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS25 DRIVE 12 SLEW FAST } [get_ports { AD9781_sdio }]

# U1: LMK01801 Clock divider
#set_property -dict { PACKAGE_PIN P19  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { lmk_clk_p }]
#set_property -dict { PACKAGE_PIN P20  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { lmk_clk_n }]
#set_property -dict { PACKAGE_PIN AC14 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { lmk_le }]
#set_property -dict { PACKAGE_PIN AF20  IOSTANDARD LVCMOS18 } [get_ports { lmk_data }]

# Shared U2 & U3 AD9653 ADC SPI
#set_property -dict { PACKAGE_PIN Y6  IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc_pdwn }]
#set_property -dict { PACKAGE_PIN V18 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc_sync }]
#set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc0_csb }]
#set_property -dict { PACKAGE_PIN W14 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc1_csb }]
#set_property -dict { PACKAGE_PIN Y15 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc_sdio }]
#set_property -dict { PACKAGE_PIN Y16 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { adc_sdio_dir }]

# U2: AD9653 ADC 0
#set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_fco_p }]
#set_property -dict { PACKAGE_PIN U20 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_fco_n }]
#set_property -dict { PACKAGE_PIN R21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_dco_p }]
#set_property -dict { PACKAGE_PIN P21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_dco_n }]
#set_property -dict { PACKAGE_PIN P24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0a_p }]
#set_property -dict { PACKAGE_PIN N24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0a_n }]
#set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1a_p }]
#set_property -dict { PACKAGE_PIN T23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1a_n }]
#set_property -dict { PACKAGE_PIN T20 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0b_p }]
#set_property -dict { PACKAGE_PIN R20 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0b_n }]
#set_property -dict { PACKAGE_PIN P23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1b_p }]
#set_property -dict { PACKAGE_PIN N23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1b_n }]
#set_property -dict { PACKAGE_PIN R25 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0c_p }]
#set_property -dict { PACKAGE_PIN P25 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0c_n }]
#set_property -dict { PACKAGE_PIN N26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1c_p }]
#set_property -dict { PACKAGE_PIN M26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1c_n }]
#set_property -dict { PACKAGE_PIN R26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0d_p }]
#set_property -dict { PACKAGE_PIN P26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d0d_n }]
#set_property -dict { PACKAGE_PIN N21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1d_p }]
#set_property -dict { PACKAGE_PIN N22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc0_d1d_n }]

# U3: AD9653 ADC 1
#set_property -dict { PACKAGE_PIN G25 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_fco_p }]
#set_property -dict { PACKAGE_PIN G26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_fco_n }]
#set_property -dict { PACKAGE_PIN F22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_dco_p }]
#set_property -dict { PACKAGE_PIN E23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_dco_n }]
#set_property -dict { PACKAGE_PIN H23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0a_p }]
#set_property -dict { PACKAGE_PIN H24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0a_n }]
#set_property -dict { PACKAGE_PIN J26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1a_p }]
#set_property -dict { PACKAGE_PIN H26 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1a_n }]
#set_property -dict { PACKAGE_PIN G22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0b_p }]
#set_property -dict { PACKAGE_PIN F23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0b_n }]
#set_property -dict { PACKAGE_PIN H21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1b_p }]
#set_property -dict { PACKAGE_PIN G21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1b_n }]
#set_property -dict { PACKAGE_PIN M24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0c_p }]
#set_property -dict { PACKAGE_PIN L24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0c_n }]
#set_property -dict { PACKAGE_PIN M25 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1c_p }]
#set_property -dict { PACKAGE_PIN L25 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1c_n }]
#set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0d_p }]
#set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d0d_n }]
#set_property -dict { PACKAGE_PIN M21 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1d_p }]
#set_property -dict { PACKAGE_PIN M22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { adc1_d1d_n }]

# U4 AD9781 DAC SPI
#set_property -dict { PACKAGE_PIN AF14 IOSTANDARD LVCMOS18 } [get_ports { dac_sdo }]
#set_property -dict { PACKAGE_PIN AF15 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { dac_csb }]
#set_property -dict { PACKAGE_PIN AD14 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { dac_reset }]

# U4: AD9781 DAC

set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { dac_dco_p }]
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { dac_dco_n }]
set_property -dict { PACKAGE_PIN B17  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_dci_p }]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_dci_n }]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[0] }]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[0] }]
set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[1] }]
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[1] }]
set_property -dict { PACKAGE_PIN A13  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[2] }]
set_property -dict { PACKAGE_PIN A14  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[2] }]
set_property -dict { PACKAGE_PIN E13  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[3] }]
set_property -dict { PACKAGE_PIN E14  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[3] }]
set_property -dict { PACKAGE_PIN C13   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[4] }]
set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[4] }]
set_property -dict { PACKAGE_PIN C14  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[5] }]
set_property -dict { PACKAGE_PIN C15  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[5] }]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[6] }]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[6] }]
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[7] }]
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[7] }]
set_property -dict { PACKAGE_PIN B20   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[8] }]
set_property -dict { PACKAGE_PIN A20   IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[8] }]
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[9] }]
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[9] }]
set_property -dict { PACKAGE_PIN F18  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[10] }]
set_property -dict { PACKAGE_PIN E18  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[10] }]
set_property -dict { PACKAGE_PIN B21  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[11] }]
set_property -dict { PACKAGE_PIN A21  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[11] }]
set_property -dict { PACKAGE_PIN E21  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[12] }]
set_property -dict { PACKAGE_PIN D21  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[12] }]
set_property -dict { PACKAGE_PIN A18  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_p[13] }]
set_property -dict { PACKAGE_PIN A19  IOSTANDARD LVDS_25 DIFF_TERM FALSE } [get_ports { dac_d_n[13] }]

# Shared Poll SPI
#set_property -dict { PACKAGE_PIN Y5   IOSTANDARD LVCMOS18 DRIVE 12 SLEW SLOW } [get_ports { poll_sclk }]
#set_property -dict { PACKAGE_PIN V19  IOSTANDARD LVCMOS18 DRIVE 12 SLEW SLOW } [get_ports { poll_mosi }]
#set_property -dict { PACKAGE_PIN AE17 IOSTANDARD LVCMOS18 DRIVE 12 SLEW SLOW } [get_ports { ad7794_csb }]
#set_property -dict { PACKAGE_PIN AF19 IOSTANDARD LVCMOS18 } [get_ports { ad7794_fclk }]
#set_property -dict { PACKAGE_PIN AF17 IOSTANDARD LVCMOS18 } [get_ports { ad7794_dout }]
#set_property -dict { PACKAGE_PIN AB20 IOSTANDARD LVCMOS18 DRIVE 12 SLEW SLOW } [get_ports { amc7823_spi_ss }]
#set_property -dict { PACKAGE_PIN AB19 IOSTANDARD LVCMOS18 } [get_ports { amc7823_spi_miso }]


# J17: PMOD 1
#set_property -dict { PACKAGE_PIN B24 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod1_1 }]
#set_property -dict { PACKAGE_PIN D26 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod1_2 }]
#set_property -dict { PACKAGE_PIN E21 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod1_3 }]
#set_property -dict { PACKAGE_PIN E25 IOSTANDARD LVCMOS18 } [get_ports { pmod1_4 }]
#set_property -dict { PACKAGE_PIN A25 IOSTANDARD LVCMOS18 } [get_ports { pmod1_7 }]
#set_property -dict { PACKAGE_PIN C26 IOSTANDARD LVCMOS18 } [get_ports { pmod1_8 }]
#set_property -dict { PACKAGE_PIN E22 IOSTANDARD LVCMOS18 } [get_ports { pmod1_9 }]
#set_property -dict { PACKAGE_PIN D25 IOSTANDARD LVCMOS18 } [get_ports { pmod1_10 }]

# J18: PMOD 2
#set_property -dict { PACKAGE_PIN AC18 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod2_1 }]
#set_property -dict { PACKAGE_PIN AD18 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod2_2 }]
#set_property -dict { PACKAGE_PIN AD15 IOSTANDARD LVCMOS18 } [get_ports { pmod2_3 }]
#set_property -dict { PACKAGE_PIN AE15 IOSTANDARD LVCMOS18 } [get_ports { pmod2_4 }]
#set_property -dict { PACKAGE_PIN Y17  IOSTANDARD LVCMOS18 } [get_ports { pmod2_7 }]
#set_property -dict { PACKAGE_PIN Y18  IOSTANDARD LVCMOS18 } [get_ports { pmod2_8 }]
#set_property -dict { PACKAGE_PIN AD20 IOSTANDARD LVCMOS18 } [get_ports { pmod2_9 }]
#set_property -dict { PACKAGE_PIN AE20 IOSTANDARD LVCMOS18 DRIVE 12 SLEW FAST } [get_ports { pmod2_10 }]

# J19: HDMI
#set_property -dict { PACKAGE_PIN B20 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_ck_p }]
#set_property -dict { PACKAGE_PIN A20 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_ck_n }]
#set_property -dict { PACKAGE_PIN B22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d0_p }]
#set_property -dict { PACKAGE_PIN A22 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d0_n }]
#set_property -dict { PACKAGE_PIN A23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d1_p }]
#set_property -dict { PACKAGE_PIN A24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d1_n }]
#set_property -dict { PACKAGE_PIN C23 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d2_p }]
#set_property -dict { PACKAGE_PIN C24 IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports { hdmi_d2_n }]
#set_property -dict { PACKAGE_PIN D21 IOSTANDARD LVCMOS18 } [get_ports { hdmi_cec }]
#set_property -dict { PACKAGE_PIN C22 IOSTANDARD LVCMOS18 } [get_ports { hdmi_scl }]
#set_property -dict { PACKAGE_PIN C21 IOSTANDARD LVCMOS18 } [get_ports { hdmi_sda }]
#set_property -dict { PACKAGE_PIN B21 IOSTANDARD LVCMOS18 } [get_ports { hdmi_det }]



# U38 KX023 Accelerometer and U17 AT24C32D I2C 
#set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS18 } [get_ports { app_scl }]
#set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS18 } [get_ports { app_sda }]

