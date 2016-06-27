-------------------------------------------------------------------------------
-- File       : bd_2_ten_gig_eth_mac_0.vhd  
-- Author     : Xilinx Inc.
-------------------------------------------------------------------------------
-- Description: This is the wrapper file for the Ten Gigabit Ethernet MAC.
-------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- (c) Copyright 2001-2014 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 
-- ------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity bd_2_ten_gig_eth_mac_0 is
  port(
    tx_clk0                            : in std_logic;
    reset                              : in std_logic;
    tx_axis_aresetn                    : in std_logic;
    tx_axis_tdata                      : in std_logic_vector(63 downto 0);
    tx_axis_tkeep                      : in std_logic_vector(7 downto 0);
    tx_axis_tready                     : out std_logic; 
    tx_axis_tvalid                     : in std_logic;
    tx_axis_tlast                      : in std_logic;
    tx_axis_tuser                      : in std_logic_vector(0 downto 0);
    tx_ifg_delay                       : in std_logic_vector(7 downto 0);
    tx_statistics_vector               : out std_logic_vector(25 downto 0);
    tx_statistics_valid                : out std_logic;
    pause_val                          : in  std_logic_vector(15 downto 0);
    pause_req                          : in  std_logic;
    
    rx_axis_aresetn                    : in std_logic;
    rx_axis_tdata                      : out std_logic_vector(63 downto 0);
    rx_axis_tkeep                      : out std_logic_vector(7 downto 0);
    rx_axis_tvalid                     : out std_logic;
    rx_axis_tuser                      : out std_logic;
    rx_axis_tlast                      : out std_logic;
    rx_statistics_vector               : out std_logic_vector(29 downto 0);
    rx_statistics_valid                : out std_logic;
    s_axi_aclk                         : in  std_logic;
    s_axi_aresetn                      : in  std_logic;
    
    s_axi_awaddr                       : in  std_logic_vector(10 downto 0);
    s_axi_awvalid                      : in  std_logic;
    s_axi_awready                      : out std_logic;
    
    s_axi_wdata                        : in  std_logic_vector(31 downto 0);
    s_axi_wvalid                       : in  std_logic;
    s_axi_wready                       : out std_logic;
    
    s_axi_bresp                        : out std_logic_vector(1 downto 0);
    s_axi_bvalid                       : out std_logic;
    s_axi_bready                       : in  std_logic;
    
    s_axi_araddr                       : in  std_logic_vector(10 downto 0);
    s_axi_arvalid                      : in  std_logic;
    s_axi_arready                      : out std_logic;
    
    s_axi_rdata                        : out std_logic_vector(31 downto 0);
    s_axi_rresp                        : out std_logic_vector(1 downto 0);
    s_axi_rvalid                       : out std_logic;
    s_axi_rready                       : in  std_logic;

    xgmacint                           : out std_logic;    
    
    mdc                                : out  std_logic;
    mdio_in                            : in std_logic;
    mdio_out                           : out std_logic;
    mdio_tri                           : out  std_logic;

    tx_dcm_locked                      : in  std_logic;
    xgmii_txd                          : out std_logic_vector(63 downto 0); -- Transmitted data
    xgmii_txc                          : out std_logic_vector(7 downto 0); -- Transmitted control
    rx_clk0                            : in std_logic;
    rx_dcm_locked                      : in std_logic;
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0));  -- received control
end bd_2_ten_gig_eth_mac_0;

library ten_gig_eth_mac_v15_0_3;
use ten_gig_eth_mac_v15_0_3.all;

architecture wrapper of bd_2_ten_gig_eth_mac_0 is

  component bd_2_ten_gig_eth_mac_0_block
  port(
    tx_clk0                            : in std_logic;
    reset                              : in std_logic;
    tx_axis_aresetn                    : in std_logic;
    tx_axis_tdata                      : in std_logic_vector(63 downto 0);
    tx_axis_tkeep                      : in std_logic_vector(7 downto 0);
    tx_axis_tready                     : out std_logic; 
    tx_axis_tvalid                     : in std_logic;
    tx_axis_tlast                      : in std_logic;
    tx_axis_tuser                      : in std_logic_vector(0 downto 0);
    tx_ifg_delay                       : in std_logic_vector(7 downto 0);
    tx_statistics_vector               : out std_logic_vector(25 downto 0);
    tx_statistics_valid                : out std_logic;
    pause_val                          : in  std_logic_vector(15 downto 0);
    pause_req                          : in  std_logic;
    rx_axis_aresetn                    : in std_logic;
    rx_axis_tdata                      : out std_logic_vector(63 downto 0);
    rx_axis_tkeep                      : out std_logic_vector(7 downto 0);
    rx_axis_tvalid                     : out std_logic;
    rx_axis_tuser                      : out std_logic;
    rx_axis_tlast                      : out std_logic;
    rx_statistics_vector               : out std_logic_vector(29 downto 0);
    rx_statistics_valid                : out std_logic;
    s_axi_aclk                         : in  std_logic;
    s_axi_aresetn                      : in  std_logic;
    
    s_axi_awaddr                       : in  std_logic_vector(10 downto 0);
    s_axi_awvalid                      : in  std_logic;
    s_axi_awready                      : out std_logic;
    
    s_axi_wdata                        : in  std_logic_vector(31 downto 0);
    s_axi_wvalid                       : in  std_logic;
    s_axi_wready                       : out std_logic;
    
    s_axi_bresp                        : out std_logic_vector(1 downto 0);
    s_axi_bvalid                       : out std_logic;
    s_axi_bready                       : in  std_logic;
    
    s_axi_araddr                       : in  std_logic_vector(10 downto 0);
    s_axi_arvalid                      : in  std_logic;
    s_axi_arready                      : out std_logic;
    
    s_axi_rdata                        : out std_logic_vector(31 downto 0);
    s_axi_rresp                        : out std_logic_vector(1 downto 0);
    s_axi_rvalid                       : out std_logic;
    s_axi_rready                       : in  std_logic;

    xgmacint                           : out std_logic;    
    
    mdc                                : out  std_logic;
    mdio_in                            : in std_logic;
    mdio_out                           : out std_logic;
    mdio_tri                           : out  std_logic;
    tx_dcm_locked                      : in  std_logic;
    xgmii_txd                          : out std_logic_vector(63 downto 0); -- Transmitted data
    xgmii_txc                          : out std_logic_vector(7 downto 0); -- Transmitted control
    rx_clk0                            : in std_logic;
    rx_dcm_locked                      : in std_logic;
    xgmii_rxd                          : in  std_logic_vector(63 downto 0); -- Received data
    xgmii_rxc                          : in  std_logic_vector(7 downto 0));  -- received control
  end component;

  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF wrapper : ARCHITECTURE IS "bd_2_ten_gig_eth_mac_0,ten_gig_eth_mac_v15_0_3,{x_ipProduct=Vivado 2015.4.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=ten_gig_eth_mac,x_ipVersion=15.0,x_ipCoreRevision=3,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,x_ipLicense=25_gig_eth_mac@2015.04(design_linking),x_ipLicense=ten_gig_eth_mac@2015.04(bought),c_family=virtex7,c_component_name=bd_2_ten_gig_eth_mac_0,c_has_stats=false,c_has_xgmii=false,c_has_management=true,c_has_wan_support=false,c_1588=0,c_pfc=false,c_tx_tuser_width=1,c_tx_stats_width=25,c_rx_stats_width=29,c_rx_vec_width=79,c_tx_vec_width=79,c_xgmii_data_width=63,c_xgmii_cntl_width=7,c_32bit=false,c_user_data_width=63,c_user_cntl_width=7,c_core_speed=10,c_axilite_freq=200}";
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF wrapper: ARCHITECTURE IS "ten_gig_eth_mac_v15_0_3,Vivado 2015.4.1";

begin

  U0 : bd_2_ten_gig_eth_mac_0_block
  port map (
    tx_clk0                            => tx_clk0,
    reset                              => reset,
    tx_axis_aresetn                    => tx_axis_aresetn,
    tx_axis_tdata                      => tx_axis_tdata,
    tx_axis_tvalid                     => tx_axis_tvalid,
    tx_axis_tlast                      => tx_axis_tlast,
    tx_axis_tuser                      => tx_axis_tuser,
    tx_ifg_delay                       => tx_ifg_delay,
    tx_axis_tkeep                      => tx_axis_tkeep,
    tx_axis_tready                     => tx_axis_tready,
    tx_statistics_vector               => tx_statistics_vector,
    tx_statistics_valid                => tx_statistics_valid,
    pause_val                          => pause_val,
    pause_req                          => pause_req,
    
    rx_axis_aresetn                    => rx_axis_aresetn,
    rx_axis_tdata                      => rx_axis_tdata,
    rx_axis_tvalid                     => rx_axis_tvalid,
    rx_axis_tuser                      => rx_axis_tuser,
    rx_axis_tlast                      => rx_axis_tlast,
    rx_axis_tkeep                      => rx_axis_tkeep,
    rx_statistics_vector               => rx_statistics_vector,
    rx_statistics_valid                => rx_statistics_valid,
    s_axi_aclk                         => s_axi_aclk,
    s_axi_aresetn                      => s_axi_aresetn,
    
    s_axi_awaddr                       => s_axi_awaddr,
    s_axi_awvalid                      => s_axi_awvalid,
    s_axi_awready                      => s_axi_awready,
    
    s_axi_wdata                        => s_axi_wdata,
    s_axi_wvalid                       => s_axi_wvalid,
    s_axi_wready                       => s_axi_wready,
    
    s_axi_bresp                        => s_axi_bresp,
    s_axi_bvalid                       => s_axi_bvalid,
    s_axi_bready                       => s_axi_bready,
    
    s_axi_araddr                       => s_axi_araddr,
    s_axi_arvalid                      => s_axi_arvalid,
    s_axi_arready                      => s_axi_arready,
    
    s_axi_rdata                        => s_axi_rdata,
    s_axi_rresp                        => s_axi_rresp,
    s_axi_rvalid                       => s_axi_rvalid,
    s_axi_rready                       => s_axi_rready,

    xgmacint                           => xgmacint,
    
    mdc                                => mdc,
    mdio_in                            => mdio_in,
    mdio_out                           => mdio_out,
    mdio_tri                           => mdio_tri,

    tx_dcm_locked                      => tx_dcm_locked,
    xgmii_txd                          => xgmii_txd,
    xgmii_txc                          => xgmii_txc,
    rx_clk0                            => rx_clk0,
    rx_dcm_locked                      => rx_dcm_locked,
    xgmii_rxd                          => xgmii_rxd,
    xgmii_rxc                          => xgmii_rxc);


end wrapper;


