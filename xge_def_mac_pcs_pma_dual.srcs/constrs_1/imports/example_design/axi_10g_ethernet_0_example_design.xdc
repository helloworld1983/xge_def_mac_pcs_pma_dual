# PART is virtex7 xc7vx690tffg1157-2


#######################################################
# Clock/period constraints                            #
#######################################################
# Main transmit clock/period constraints

create_clock -period 5.000 [get_ports clk_in_p]
set_input_jitter clk_in_p 0.050

#######################################################
# Synchronizer False paths
#######################################################
#set_false_path -to [get_cells -hierarchical -filter {NAME =~ pattern_generator*sync1_r_reg[0]}]
#set_false_path -to [get_cells -hierarchical -filter {NAME =~ reset_error_sync_reg*sync1_r_reg[0]}]
#set_false_path -to [get_cells -hierarchical -filter {NAME =~ gen_enable_sync/sync1_r_reg[0]}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */pattern_generator*sync1_r_reg[0]}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */reset_error_sync_reg*sync1_r_reg[0]}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ */gen_enable_sync/sync1_r_reg[0]}]


#######################################################
# FIFO level constraints
#######################################################

#set_false_path -from [get_cells fifo_block_i/ethernet_mac_fifo_i/*/wr_store_frame_tog_reg] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
#set_max_delay 3.2000 -datapath_only  -from [get_cells {fifo_block_i/ethernet_mac_fifo_i/*/rd_addr_gray_reg_reg[*]}] -to [get_cells fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
#set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells {fifo_block_i/ethernet_mac_fifo_i/*/*/reset_async*_reg}]]
set_false_path -from [get_cells */fifo_block_i/ethernet_mac_fifo_i/*/wr_store_frame_tog_reg] -to [get_cells */fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*]
set_max_delay -datapath_only -from [get_cells {*/fifo_block_i/ethernet_mac_fifo_i/*/rd_addr_gray_reg_reg[*]}] -to [get_cells */fifo_block_i/ethernet_mac_fifo_i/*/*/sync1_r_reg*] 3.200
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells */fifo_block_i/ethernet_mac_fifo_i/*/*/reset_async*_reg]]


#######################################################
# I/O constraints                                     #
#######################################################

# These inputs can be connected to dip switches or push buttons on an
# appropriate board.

#set_false_path -from [get_ports reset]
#set_false_path -from [get_ports reset_error]
#set_false_path -from [get_ports insert_error]
#set_false_path -from [get_ports pcs_loopback]
#set_false_path -from [get_ports enable_pat_gen]
#set_false_path -from [get_ports enable_pat_check]
#set_false_path -from [get_ports enable_custom_preamble]
#set_case_analysis 0  [get_ports sim_speedup_control]

# These outputs can be connected to LED's or headers on an
# appropriate board.

#set_false_path -to [get_ports core_ready]
#set_false_path -to [get_ports coreclk_out]
#set_false_path -to [get_ports qplllock_out]
#set_false_path -to [get_ports frame_error]
#set_false_path -to [get_ports gen_active_flash]
#set_false_path -to [get_ports check_active_flash]
#set_false_path -to [get_ports serialized_stats]

set_property PACKAGE_PIN AD29 [get_ports clk_in_p]
set_property IOSTANDARD LVDS [get_ports clk_in_p]
#set_property PACKAGE_PIN H5 [get_ports clk_in_n]
#set_property IOSTANDARD LVDS [get_ports clk_in_n]
set_property PACKAGE_PIN T6 [get_ports refclk_p]
set_property PACKAGE_PIN U4 [get_ports rx0_p]
set_property PACKAGE_PIN T2 [get_ports tx0_p]
set_property PACKAGE_PIN R4 [get_ports rx1_p]
set_property PACKAGE_PIN P2 [get_ports tx1_p]

#set_clock_groups -asynchronous -group refclk_p -group clk_in_p
set_clock_groups -asynchronous -group refclk_p -group s_axi_dcm_aclk0

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list master_0/fifo_block_i/ethernet_core_i/U0/ten_gig_eth_pcs_pma/U0/ten_gig_eth_pcs_pma_shared_clock_reset_block/coreclk_out]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {slave_0/fifo_block_i/tx_axis_mac_tkeep[0]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[1]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[2]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[3]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[4]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[5]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[6]} {slave_0/fifo_block_i/tx_axis_mac_tkeep[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {slave_0/fifo_block_i/tx_axis_mac_tdata[0]} {slave_0/fifo_block_i/tx_axis_mac_tdata[1]} {slave_0/fifo_block_i/tx_axis_mac_tdata[2]} {slave_0/fifo_block_i/tx_axis_mac_tdata[3]} {slave_0/fifo_block_i/tx_axis_mac_tdata[4]} {slave_0/fifo_block_i/tx_axis_mac_tdata[5]} {slave_0/fifo_block_i/tx_axis_mac_tdata[6]} {slave_0/fifo_block_i/tx_axis_mac_tdata[7]} {slave_0/fifo_block_i/tx_axis_mac_tdata[8]} {slave_0/fifo_block_i/tx_axis_mac_tdata[9]} {slave_0/fifo_block_i/tx_axis_mac_tdata[10]} {slave_0/fifo_block_i/tx_axis_mac_tdata[11]} {slave_0/fifo_block_i/tx_axis_mac_tdata[12]} {slave_0/fifo_block_i/tx_axis_mac_tdata[13]} {slave_0/fifo_block_i/tx_axis_mac_tdata[14]} {slave_0/fifo_block_i/tx_axis_mac_tdata[15]} {slave_0/fifo_block_i/tx_axis_mac_tdata[16]} {slave_0/fifo_block_i/tx_axis_mac_tdata[17]} {slave_0/fifo_block_i/tx_axis_mac_tdata[18]} {slave_0/fifo_block_i/tx_axis_mac_tdata[19]} {slave_0/fifo_block_i/tx_axis_mac_tdata[20]} {slave_0/fifo_block_i/tx_axis_mac_tdata[21]} {slave_0/fifo_block_i/tx_axis_mac_tdata[22]} {slave_0/fifo_block_i/tx_axis_mac_tdata[23]} {slave_0/fifo_block_i/tx_axis_mac_tdata[24]} {slave_0/fifo_block_i/tx_axis_mac_tdata[25]} {slave_0/fifo_block_i/tx_axis_mac_tdata[26]} {slave_0/fifo_block_i/tx_axis_mac_tdata[27]} {slave_0/fifo_block_i/tx_axis_mac_tdata[28]} {slave_0/fifo_block_i/tx_axis_mac_tdata[29]} {slave_0/fifo_block_i/tx_axis_mac_tdata[30]} {slave_0/fifo_block_i/tx_axis_mac_tdata[31]} {slave_0/fifo_block_i/tx_axis_mac_tdata[32]} {slave_0/fifo_block_i/tx_axis_mac_tdata[33]} {slave_0/fifo_block_i/tx_axis_mac_tdata[34]} {slave_0/fifo_block_i/tx_axis_mac_tdata[35]} {slave_0/fifo_block_i/tx_axis_mac_tdata[36]} {slave_0/fifo_block_i/tx_axis_mac_tdata[37]} {slave_0/fifo_block_i/tx_axis_mac_tdata[38]} {slave_0/fifo_block_i/tx_axis_mac_tdata[39]} {slave_0/fifo_block_i/tx_axis_mac_tdata[40]} {slave_0/fifo_block_i/tx_axis_mac_tdata[41]} {slave_0/fifo_block_i/tx_axis_mac_tdata[42]} {slave_0/fifo_block_i/tx_axis_mac_tdata[43]} {slave_0/fifo_block_i/tx_axis_mac_tdata[44]} {slave_0/fifo_block_i/tx_axis_mac_tdata[45]} {slave_0/fifo_block_i/tx_axis_mac_tdata[46]} {slave_0/fifo_block_i/tx_axis_mac_tdata[47]} {slave_0/fifo_block_i/tx_axis_mac_tdata[48]} {slave_0/fifo_block_i/tx_axis_mac_tdata[49]} {slave_0/fifo_block_i/tx_axis_mac_tdata[50]} {slave_0/fifo_block_i/tx_axis_mac_tdata[51]} {slave_0/fifo_block_i/tx_axis_mac_tdata[52]} {slave_0/fifo_block_i/tx_axis_mac_tdata[53]} {slave_0/fifo_block_i/tx_axis_mac_tdata[54]} {slave_0/fifo_block_i/tx_axis_mac_tdata[55]} {slave_0/fifo_block_i/tx_axis_mac_tdata[56]} {slave_0/fifo_block_i/tx_axis_mac_tdata[57]} {slave_0/fifo_block_i/tx_axis_mac_tdata[58]} {slave_0/fifo_block_i/tx_axis_mac_tdata[59]} {slave_0/fifo_block_i/tx_axis_mac_tdata[60]} {slave_0/fifo_block_i/tx_axis_mac_tdata[61]} {slave_0/fifo_block_i/tx_axis_mac_tdata[62]} {slave_0/fifo_block_i/tx_axis_mac_tdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {slave_0/fifo_block_i/rx_axis_mac_tkeep[0]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[1]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[2]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[3]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[4]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[5]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[6]} {slave_0/fifo_block_i/rx_axis_mac_tkeep[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 64 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {slave_0/fifo_block_i/rx_axis_mac_tdata[0]} {slave_0/fifo_block_i/rx_axis_mac_tdata[1]} {slave_0/fifo_block_i/rx_axis_mac_tdata[2]} {slave_0/fifo_block_i/rx_axis_mac_tdata[3]} {slave_0/fifo_block_i/rx_axis_mac_tdata[4]} {slave_0/fifo_block_i/rx_axis_mac_tdata[5]} {slave_0/fifo_block_i/rx_axis_mac_tdata[6]} {slave_0/fifo_block_i/rx_axis_mac_tdata[7]} {slave_0/fifo_block_i/rx_axis_mac_tdata[8]} {slave_0/fifo_block_i/rx_axis_mac_tdata[9]} {slave_0/fifo_block_i/rx_axis_mac_tdata[10]} {slave_0/fifo_block_i/rx_axis_mac_tdata[11]} {slave_0/fifo_block_i/rx_axis_mac_tdata[12]} {slave_0/fifo_block_i/rx_axis_mac_tdata[13]} {slave_0/fifo_block_i/rx_axis_mac_tdata[14]} {slave_0/fifo_block_i/rx_axis_mac_tdata[15]} {slave_0/fifo_block_i/rx_axis_mac_tdata[16]} {slave_0/fifo_block_i/rx_axis_mac_tdata[17]} {slave_0/fifo_block_i/rx_axis_mac_tdata[18]} {slave_0/fifo_block_i/rx_axis_mac_tdata[19]} {slave_0/fifo_block_i/rx_axis_mac_tdata[20]} {slave_0/fifo_block_i/rx_axis_mac_tdata[21]} {slave_0/fifo_block_i/rx_axis_mac_tdata[22]} {slave_0/fifo_block_i/rx_axis_mac_tdata[23]} {slave_0/fifo_block_i/rx_axis_mac_tdata[24]} {slave_0/fifo_block_i/rx_axis_mac_tdata[25]} {slave_0/fifo_block_i/rx_axis_mac_tdata[26]} {slave_0/fifo_block_i/rx_axis_mac_tdata[27]} {slave_0/fifo_block_i/rx_axis_mac_tdata[28]} {slave_0/fifo_block_i/rx_axis_mac_tdata[29]} {slave_0/fifo_block_i/rx_axis_mac_tdata[30]} {slave_0/fifo_block_i/rx_axis_mac_tdata[31]} {slave_0/fifo_block_i/rx_axis_mac_tdata[32]} {slave_0/fifo_block_i/rx_axis_mac_tdata[33]} {slave_0/fifo_block_i/rx_axis_mac_tdata[34]} {slave_0/fifo_block_i/rx_axis_mac_tdata[35]} {slave_0/fifo_block_i/rx_axis_mac_tdata[36]} {slave_0/fifo_block_i/rx_axis_mac_tdata[37]} {slave_0/fifo_block_i/rx_axis_mac_tdata[38]} {slave_0/fifo_block_i/rx_axis_mac_tdata[39]} {slave_0/fifo_block_i/rx_axis_mac_tdata[40]} {slave_0/fifo_block_i/rx_axis_mac_tdata[41]} {slave_0/fifo_block_i/rx_axis_mac_tdata[42]} {slave_0/fifo_block_i/rx_axis_mac_tdata[43]} {slave_0/fifo_block_i/rx_axis_mac_tdata[44]} {slave_0/fifo_block_i/rx_axis_mac_tdata[45]} {slave_0/fifo_block_i/rx_axis_mac_tdata[46]} {slave_0/fifo_block_i/rx_axis_mac_tdata[47]} {slave_0/fifo_block_i/rx_axis_mac_tdata[48]} {slave_0/fifo_block_i/rx_axis_mac_tdata[49]} {slave_0/fifo_block_i/rx_axis_mac_tdata[50]} {slave_0/fifo_block_i/rx_axis_mac_tdata[51]} {slave_0/fifo_block_i/rx_axis_mac_tdata[52]} {slave_0/fifo_block_i/rx_axis_mac_tdata[53]} {slave_0/fifo_block_i/rx_axis_mac_tdata[54]} {slave_0/fifo_block_i/rx_axis_mac_tdata[55]} {slave_0/fifo_block_i/rx_axis_mac_tdata[56]} {slave_0/fifo_block_i/rx_axis_mac_tdata[57]} {slave_0/fifo_block_i/rx_axis_mac_tdata[58]} {slave_0/fifo_block_i/rx_axis_mac_tdata[59]} {slave_0/fifo_block_i/rx_axis_mac_tdata[60]} {slave_0/fifo_block_i/rx_axis_mac_tdata[61]} {slave_0/fifo_block_i/rx_axis_mac_tdata[62]} {slave_0/fifo_block_i/rx_axis_mac_tdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {master_0/fifo_block_i/tx_axis_mac_tkeep[0]} {master_0/fifo_block_i/tx_axis_mac_tkeep[1]} {master_0/fifo_block_i/tx_axis_mac_tkeep[2]} {master_0/fifo_block_i/tx_axis_mac_tkeep[3]} {master_0/fifo_block_i/tx_axis_mac_tkeep[4]} {master_0/fifo_block_i/tx_axis_mac_tkeep[5]} {master_0/fifo_block_i/tx_axis_mac_tkeep[6]} {master_0/fifo_block_i/tx_axis_mac_tkeep[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 64 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {master_0/fifo_block_i/tx_axis_mac_tdata[0]} {master_0/fifo_block_i/tx_axis_mac_tdata[1]} {master_0/fifo_block_i/tx_axis_mac_tdata[2]} {master_0/fifo_block_i/tx_axis_mac_tdata[3]} {master_0/fifo_block_i/tx_axis_mac_tdata[4]} {master_0/fifo_block_i/tx_axis_mac_tdata[5]} {master_0/fifo_block_i/tx_axis_mac_tdata[6]} {master_0/fifo_block_i/tx_axis_mac_tdata[7]} {master_0/fifo_block_i/tx_axis_mac_tdata[8]} {master_0/fifo_block_i/tx_axis_mac_tdata[9]} {master_0/fifo_block_i/tx_axis_mac_tdata[10]} {master_0/fifo_block_i/tx_axis_mac_tdata[11]} {master_0/fifo_block_i/tx_axis_mac_tdata[12]} {master_0/fifo_block_i/tx_axis_mac_tdata[13]} {master_0/fifo_block_i/tx_axis_mac_tdata[14]} {master_0/fifo_block_i/tx_axis_mac_tdata[15]} {master_0/fifo_block_i/tx_axis_mac_tdata[16]} {master_0/fifo_block_i/tx_axis_mac_tdata[17]} {master_0/fifo_block_i/tx_axis_mac_tdata[18]} {master_0/fifo_block_i/tx_axis_mac_tdata[19]} {master_0/fifo_block_i/tx_axis_mac_tdata[20]} {master_0/fifo_block_i/tx_axis_mac_tdata[21]} {master_0/fifo_block_i/tx_axis_mac_tdata[22]} {master_0/fifo_block_i/tx_axis_mac_tdata[23]} {master_0/fifo_block_i/tx_axis_mac_tdata[24]} {master_0/fifo_block_i/tx_axis_mac_tdata[25]} {master_0/fifo_block_i/tx_axis_mac_tdata[26]} {master_0/fifo_block_i/tx_axis_mac_tdata[27]} {master_0/fifo_block_i/tx_axis_mac_tdata[28]} {master_0/fifo_block_i/tx_axis_mac_tdata[29]} {master_0/fifo_block_i/tx_axis_mac_tdata[30]} {master_0/fifo_block_i/tx_axis_mac_tdata[31]} {master_0/fifo_block_i/tx_axis_mac_tdata[32]} {master_0/fifo_block_i/tx_axis_mac_tdata[33]} {master_0/fifo_block_i/tx_axis_mac_tdata[34]} {master_0/fifo_block_i/tx_axis_mac_tdata[35]} {master_0/fifo_block_i/tx_axis_mac_tdata[36]} {master_0/fifo_block_i/tx_axis_mac_tdata[37]} {master_0/fifo_block_i/tx_axis_mac_tdata[38]} {master_0/fifo_block_i/tx_axis_mac_tdata[39]} {master_0/fifo_block_i/tx_axis_mac_tdata[40]} {master_0/fifo_block_i/tx_axis_mac_tdata[41]} {master_0/fifo_block_i/tx_axis_mac_tdata[42]} {master_0/fifo_block_i/tx_axis_mac_tdata[43]} {master_0/fifo_block_i/tx_axis_mac_tdata[44]} {master_0/fifo_block_i/tx_axis_mac_tdata[45]} {master_0/fifo_block_i/tx_axis_mac_tdata[46]} {master_0/fifo_block_i/tx_axis_mac_tdata[47]} {master_0/fifo_block_i/tx_axis_mac_tdata[48]} {master_0/fifo_block_i/tx_axis_mac_tdata[49]} {master_0/fifo_block_i/tx_axis_mac_tdata[50]} {master_0/fifo_block_i/tx_axis_mac_tdata[51]} {master_0/fifo_block_i/tx_axis_mac_tdata[52]} {master_0/fifo_block_i/tx_axis_mac_tdata[53]} {master_0/fifo_block_i/tx_axis_mac_tdata[54]} {master_0/fifo_block_i/tx_axis_mac_tdata[55]} {master_0/fifo_block_i/tx_axis_mac_tdata[56]} {master_0/fifo_block_i/tx_axis_mac_tdata[57]} {master_0/fifo_block_i/tx_axis_mac_tdata[58]} {master_0/fifo_block_i/tx_axis_mac_tdata[59]} {master_0/fifo_block_i/tx_axis_mac_tdata[60]} {master_0/fifo_block_i/tx_axis_mac_tdata[61]} {master_0/fifo_block_i/tx_axis_mac_tdata[62]} {master_0/fifo_block_i/tx_axis_mac_tdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {master_0/fifo_block_i/rx_axis_mac_tkeep[0]} {master_0/fifo_block_i/rx_axis_mac_tkeep[1]} {master_0/fifo_block_i/rx_axis_mac_tkeep[2]} {master_0/fifo_block_i/rx_axis_mac_tkeep[3]} {master_0/fifo_block_i/rx_axis_mac_tkeep[4]} {master_0/fifo_block_i/rx_axis_mac_tkeep[5]} {master_0/fifo_block_i/rx_axis_mac_tkeep[6]} {master_0/fifo_block_i/rx_axis_mac_tkeep[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 64 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {master_0/fifo_block_i/rx_axis_mac_tdata[0]} {master_0/fifo_block_i/rx_axis_mac_tdata[1]} {master_0/fifo_block_i/rx_axis_mac_tdata[2]} {master_0/fifo_block_i/rx_axis_mac_tdata[3]} {master_0/fifo_block_i/rx_axis_mac_tdata[4]} {master_0/fifo_block_i/rx_axis_mac_tdata[5]} {master_0/fifo_block_i/rx_axis_mac_tdata[6]} {master_0/fifo_block_i/rx_axis_mac_tdata[7]} {master_0/fifo_block_i/rx_axis_mac_tdata[8]} {master_0/fifo_block_i/rx_axis_mac_tdata[9]} {master_0/fifo_block_i/rx_axis_mac_tdata[10]} {master_0/fifo_block_i/rx_axis_mac_tdata[11]} {master_0/fifo_block_i/rx_axis_mac_tdata[12]} {master_0/fifo_block_i/rx_axis_mac_tdata[13]} {master_0/fifo_block_i/rx_axis_mac_tdata[14]} {master_0/fifo_block_i/rx_axis_mac_tdata[15]} {master_0/fifo_block_i/rx_axis_mac_tdata[16]} {master_0/fifo_block_i/rx_axis_mac_tdata[17]} {master_0/fifo_block_i/rx_axis_mac_tdata[18]} {master_0/fifo_block_i/rx_axis_mac_tdata[19]} {master_0/fifo_block_i/rx_axis_mac_tdata[20]} {master_0/fifo_block_i/rx_axis_mac_tdata[21]} {master_0/fifo_block_i/rx_axis_mac_tdata[22]} {master_0/fifo_block_i/rx_axis_mac_tdata[23]} {master_0/fifo_block_i/rx_axis_mac_tdata[24]} {master_0/fifo_block_i/rx_axis_mac_tdata[25]} {master_0/fifo_block_i/rx_axis_mac_tdata[26]} {master_0/fifo_block_i/rx_axis_mac_tdata[27]} {master_0/fifo_block_i/rx_axis_mac_tdata[28]} {master_0/fifo_block_i/rx_axis_mac_tdata[29]} {master_0/fifo_block_i/rx_axis_mac_tdata[30]} {master_0/fifo_block_i/rx_axis_mac_tdata[31]} {master_0/fifo_block_i/rx_axis_mac_tdata[32]} {master_0/fifo_block_i/rx_axis_mac_tdata[33]} {master_0/fifo_block_i/rx_axis_mac_tdata[34]} {master_0/fifo_block_i/rx_axis_mac_tdata[35]} {master_0/fifo_block_i/rx_axis_mac_tdata[36]} {master_0/fifo_block_i/rx_axis_mac_tdata[37]} {master_0/fifo_block_i/rx_axis_mac_tdata[38]} {master_0/fifo_block_i/rx_axis_mac_tdata[39]} {master_0/fifo_block_i/rx_axis_mac_tdata[40]} {master_0/fifo_block_i/rx_axis_mac_tdata[41]} {master_0/fifo_block_i/rx_axis_mac_tdata[42]} {master_0/fifo_block_i/rx_axis_mac_tdata[43]} {master_0/fifo_block_i/rx_axis_mac_tdata[44]} {master_0/fifo_block_i/rx_axis_mac_tdata[45]} {master_0/fifo_block_i/rx_axis_mac_tdata[46]} {master_0/fifo_block_i/rx_axis_mac_tdata[47]} {master_0/fifo_block_i/rx_axis_mac_tdata[48]} {master_0/fifo_block_i/rx_axis_mac_tdata[49]} {master_0/fifo_block_i/rx_axis_mac_tdata[50]} {master_0/fifo_block_i/rx_axis_mac_tdata[51]} {master_0/fifo_block_i/rx_axis_mac_tdata[52]} {master_0/fifo_block_i/rx_axis_mac_tdata[53]} {master_0/fifo_block_i/rx_axis_mac_tdata[54]} {master_0/fifo_block_i/rx_axis_mac_tdata[55]} {master_0/fifo_block_i/rx_axis_mac_tdata[56]} {master_0/fifo_block_i/rx_axis_mac_tdata[57]} {master_0/fifo_block_i/rx_axis_mac_tdata[58]} {master_0/fifo_block_i/rx_axis_mac_tdata[59]} {master_0/fifo_block_i/rx_axis_mac_tdata[60]} {master_0/fifo_block_i/rx_axis_mac_tdata[61]} {master_0/fifo_block_i/rx_axis_mac_tdata[62]} {master_0/fifo_block_i/rx_axis_mac_tdata[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list slave_0/fifo_block_i/rx_axis_mac_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list master_0/fifo_block_i/rx_axis_mac_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list master_0/fifo_block_i/rx_axis_mac_tuser]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list slave_0/fifo_block_i/rx_axis_mac_tuser]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list master_0/fifo_block_i/rx_axis_mac_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list slave_0/fifo_block_i/rx_axis_mac_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list master_0/fifo_block_i/tx_axis_mac_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list slave_0/fifo_block_i/tx_axis_mac_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list master_0/fifo_block_i/tx_axis_mac_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list slave_0/fifo_block_i/tx_axis_mac_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list slave_0/fifo_block_i/tx_axis_mac_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list master_0/fifo_block_i/tx_axis_mac_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets coreclk_out]
