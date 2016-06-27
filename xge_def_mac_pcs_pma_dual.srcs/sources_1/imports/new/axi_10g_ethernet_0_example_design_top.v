`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2016 09:11:56 PM
// Design Name: 
// Module Name: axi_10g_ethernet_0_example_design_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axi_10g_ethernet_0_example_design_top
  (
   // Clock inputs
   input             clk_in_p,       // Freerunning clock source
   input             clk_in_n,
   input             refclk_p,       // Transceiver reference clock source
   input             refclk_n,

   // Serial I/O from/to transceiver
   output            tx0_p,
   output            tx0_n,
   input             rx0_p,
   input             rx0_n,
   output            tx1_p,
   output            tx1_n,
   input             rx1_p,
   input             rx1_n
  );

   wire              coreclk_out;
   wire              s_axi_aclk;
   wire              tx_dcm_locked;

   // CUSTOMISED CONFIGURATOR
   wire [47:0]       master_0_dest_addr;
   wire [47:0]       slave_0_dest_addr;
   wire [47:0]       src_addr;

   // MASTER EXPORT-SLAVE IMPORT RELAY
   wire              areset_coreclk_relay;
   wire              txusrclk_relay;
   wire              txusrclk2_relay;
   wire              txuserrdy_relay;
   wire              resetdone_relay;
   wire              reset_counter_done_relay;
   wire              gttxreset_relay;
   wire              gtrxreset_relay;
   wire              qplllock_relay;
   wire              qplloutclk_relay;
   wire              qplloutrefclk_relay;

   // Example design control inputs
   wire              pcs_loopback;
   wire              reset;
   wire              reset_error;
   wire              insert_error;
   wire              enable_pat_gen;
   wire              enable_pat_check;
   wire              master_0_serialized_stats;
   wire              slave_0_serialized_stats;
   wire              sim_speedup_control;
   wire              enable_custom_preamble;

   // Example design status outputs
   wire              master_0_frame_error;
   wire              master_0_gen_active_flash;
   wire              master_0_check_active_flash;
   wire              master_0_core_ready;
   wire              master_0_qplllock_out;

   wire              slave_0_frame_error;
   wire              slave_0_gen_active_flash;
   wire              slave_0_check_active_flash;
   wire              slave_0_core_ready;
   wire              slave_0_qplllock_out;

axi_10g_ethernet_master_clocking axi_lite_clocking_i (
  .clk_in_p                        (clk_in_p),
  .clk_in_n                        (clk_in_n),
  .s_axi_aclk                      (s_axi_aclk),
  .tx_mmcm_reset                   (reset),
  .tx_mmcm_locked                  (tx_dcm_locked)
);

vio_0 vio(
  .clk                             (coreclk_out),
  .probe_out0                      ({reset,
                                     reset_error,
                                     enable_pat_gen,
                                     enable_pat_check,
                                     pcs_loopback,
                                     insert_error,
                                     sim_speedup_control,
                                     enable_custom_preamble}),
  .probe_out1                      (src_addr),
  .probe_out2                      (master_0_dest_addr),
  .probe_out3                      (slave_0_dest_addr),

// Example design status outputs
  .probe_in0                       ({master_0_core_ready,
                                     master_0_gen_active_flash,
                                     master_0_check_active_flash,
                                     master_0_frame_error,
                                     master_0_serialized_stats,
                                     master_0_qplllock_out}),
  .probe_in1                       ({slave_0_core_ready,
                                     slave_0_gen_active_flash,
                                     slave_0_check_active_flash,
                                     slave_0_frame_error,
                                     slave_0_serialized_stats,
                                     slave_0_qplllock_out})
);

axi_10g_ethernet_master_example_design master_0
  (
   // Clock inputs
//   .clk_in_p               (clk_in_p),       // Freerunning clock source
//   .clk_in_n               (clk_in_n),
   .refclk_p               (refclk_p),       // Transceiver reference clock source
   .refclk_n               (refclk_n),
   .coreclk_out            (coreclk_out),
   .s_axi_aclk             (s_axi_aclk),
   .tx_dcm_locked          (tx_dcm_locked),

   // CUSTOMISED CONFIGURATOR
   .dest_addr              (master_0_dest_addr),
   .src_addr               (src_addr),

   // EXPORTING SHARED LOGIC
   .areset_datapathclk_out (areset_coreclk_relay),
   .txusrclk_out           (txusrclk_relay),
   .txusrclk2_out          (txusrclk2_relay),
   .txuserrdy_out          (txuserrdy_relay),
   .resetdone_out          (resetdone_relay),
   .reset_counter_done_out (reset_counter_done_relay),
   .gttxreset_out          (gttxreset_relay),
   .gtrxreset_out          (gtrxreset_relay),
//   .qplllock_out           (qplllock_relay),
   .qplloutclk_out         (qplloutclk_relay),
   .qplloutrefclk_out      (qplloutrefclk_relay),

   // Example design control inputs
   .pcs_loopback           (pcs_loopback),
   .reset                  (reset),
   .reset_error            (reset_error),
   .insert_error           (insert_error),
   .enable_pat_gen         (enable_pat_gen),
   .enable_pat_check       (enable_pat_check),
   .serialized_stats       (master_0_serialized_stats),
   .sim_speedup_control    (sim_speedup_control),
   .enable_custom_preamble (enable_custom_preamble),

   // Example design status outputs
   .frame_error            (master_0_frame_error),
   .gen_active_flash       (master_0_gen_active_flash),
   .check_active_flash     (master_0_check_active_flash),
   .core_ready             (master_0_core_ready),
   .qplllock_out           (master_0_qplllock_out),

   // Serial I/O from/to transceiver
   .txp                    (tx0_p),
   .txn                    (tx0_n),
   .rxp                    (rx0_p),
   .rxn                    (rx0_n)
  );

axi_10g_ethernet_slave_example_design slave_0
  (
   // Clock inputs
//   .clk_in_p               (clk_in_p),       // Freerunning clock source
//   .clk_in_n               (clk_in_n),
//   .refclk_p               (refclk_p),       // Transceiver reference clock source     // ELIMINATED AFTER IMPORTING SHARED LOGIC
//   .refclk_n               (refclk_n),       // ELIMINATED AFTER IMPORTING SHARED LOGIC
//   .coreclk_out            (coreclk_out),    // ELIMINATED AFTER IMPORTING SHARED LOGIC
   .s_axi_aclk             (s_axi_aclk),
   .tx_dcm_locked          (tx_dcm_locked),

   // CUSTOMISED CONFIGURATOR
   .dest_addr              (slave_0_dest_addr),
   .src_addr               (src_addr),

   // IMPORTING SHARED LOGIC
   .coreclk                (coreclk_out),
   .areset_coreclk         (areset_coreclk_relay),
   .txusrclk               (txusrclk_relay),
   .txusrclk2              (txusrclk2_relay),
   .txuserrdy              (txuserrdy_relay),
   .reset_counter_done     (reset_counter_done_relay),
   .gttxreset              (gttxreset_relay),
   .gtrxreset              (gtrxreset_relay),
//   .qplllock               (qplllock_relay),
   .qplllock               (master_0_qplllock_out),
   .qplloutclk             (qplloutclk_relay),
   .qplloutrefclk          (qplloutrefclk_relay),

   // Example design control inputs
   .pcs_loopback           (pcs_loopback),
   .reset                  (reset),
   .reset_error            (reset_error),
   .insert_error           (insert_error),
   .enable_pat_gen         (enable_pat_gen),
   .enable_pat_check       (enable_pat_check),
   .serialized_stats       (slave_0_serialized_stats),
   .sim_speedup_control    (sim_speedup_control),
   .enable_custom_preamble (enable_custom_preamble),

   // Example design status outputs
   .frame_error            (slave_0_frame_error),
   .gen_active_flash       (slave_0_gen_active_flash),
   .check_active_flash     (slave_0_check_active_flash),
   .core_ready             (slave_0_core_ready),
//   .qplllock_out           (slave_0_qplllock_out), // ELIMINATING AFTER EXPORTING SHARED LOGIC

   // Serial I/O from/to transceiver
   .txp                    (tx1_p),
   .txn                    (tx1_n),
   .rxp                    (rx1_p),
   .rxn                    (rx1_n)
  );

assign slave_0_qplllock_out = master_0_qplllock_out;

endmodule