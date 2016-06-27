-- (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--***************************** Entity Declaration ****************************

entity bd_2_ten_gig_eth_pcs_pma_0_gtwizard_gth_10gbaser_GT is
generic
(
    -- Simulation attributes
    GT_SIM_GTRESET_SPEEDUP    : string := "FALSE"; -- Set to "TRUE" to speed up sim reset
    EXAMPLE_SIMULATION        : integer  := 0;     -- Set to 1 for simulation
    TXSYNC_OVRD_IN            : bit    := '0';
    TXSYNC_MULTILANE_IN       : bit    := '0' 
);
port 
(
    ---------------------------- Channel - DRP Ports  --------------------------
    drpaddr_in                              : in   std_logic_vector(8 downto 0);
    drpclk_in                               : in   std_logic;
    drpdi_in                                : in   std_logic_vector(15 downto 0);
    drpdo_out                               : out  std_logic_vector(15 downto 0);
    drpen_in                                : in   std_logic;
    drprdy_out                              : out  std_logic;
    drpwe_in                                : in   std_logic;
    ------------------------------- Clocking Ports -----------------------------
    qpllclk_in                              : in   std_logic;
    qpllrefclk_in                           : in   std_logic;
    ------------------------------- Loopback Ports -----------------------------
    loopback_in                             : in   std_logic_vector(2 downto 0);
    ----------------------------- PCI Express Ports ----------------------------
    rxrate_in                               : in   std_logic_vector(2 downto 0);
    --------------------- RX Initialization and Reset Ports --------------------
    eyescanreset_in                         : in   std_logic;
    rxuserrdy_in                            : in   std_logic;
    -------------------------- RX Margin Analysis Ports ------------------------
    eyescandataerror_out                    : out  std_logic;
    eyescantrigger_in                       : in   std_logic;
    ------------------------- Receive Ports - CDR Ports ------------------------
    rxcdrhold_in                            : in   std_logic;
    ------------------- Receive Ports - Digital Monitor Ports ------------------
    dmonitorout_out                         : out  std_logic_vector(14 downto 0);
    ------------------ Receive Ports - FPGA RX Interface Ports -----------------
    rxusrclk_in                             : in   std_logic;
    rxusrclk2_in                            : in   std_logic;
    ------------------ Receive Ports - FPGA RX interface Ports -----------------
    rxdata_out                              : out  std_logic_vector(31 downto 0);
    ------------------- Receive Ports - Pattern Checker Ports ------------------
    rxprbserr_out                           : out  std_logic;
    rxprbssel_in                            : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - Pattern Checker ports ------------------
    rxprbscntreset_in                       : in   std_logic;
    ------------------------ Receive Ports - RX AFE Ports ----------------------
    gthrxn_in                               : in   std_logic;
    ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
    rxbufreset_in                           : in   std_logic;
    rxbufstatus_out                         : out  std_logic_vector(2 downto 0);
    ------------------- Receive Ports - RX Equalizer Ports ---------------------
    rxdfeagchold_in                         : in   std_logic;
    rxdfelpmreset_in                        : in   std_logic;
    --------------- Receive Ports - RX Fabric Output Control Ports -------------
    rxoutclk_out                            : out  std_logic;
    ---------------------- Receive Ports - RX Gearbox Ports --------------------
    rxdatavalid_out                         : out  std_logic;
    rxheader_out                            : out  std_logic_vector(1 downto 0);
    rxheadervalid_out                       : out  std_logic;
    --------------------- Receive Ports - RX Gearbox Ports  --------------------
    rxgearboxslip_in                        : in   std_logic;
    ------------- Receive Ports - RX Initialization and Reset Ports ------------
    gtrxreset_in                            : in   std_logic;
    rxpcsreset_in                           : in   std_logic;
    rxpmareset_in                           : in   std_logic;
    ------------------ Receive Ports - RX Margin Analysis ports ----------------
    rxlpmen_in                              : in   std_logic;
    ----------------- Receive Ports - RX Polarity Control Ports ----------------
    rxpolarity_in                           : in   std_logic;
    ------------------------ Receive Ports -RX AFE Ports -----------------------
    gthrxp_in                               : in   std_logic;
    -------------- Receive Ports -RX Initialization and Reset Ports ------------
    rxresetdone_out                         : out  std_logic;
    rxpmaresetdone_out                      : out  std_logic;
    ------------------------ TX Configurable Driver Ports ----------------------
    txpostcursor_in                         : in   std_logic_vector(4 downto 0);
    txprecursor_in                          : in   std_logic_vector(4 downto 0);
    --------------------- TX Initialization and Reset Ports --------------------
    gttxreset_in                            : in   std_logic;
    txuserrdy_in                            : in   std_logic;
    -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    txheader_in                             : in   std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
    txusrclk_in                             : in   std_logic;
    txusrclk2_in                            : in   std_logic;
    ------------------ Transmit Ports - Pattern Generator Ports ----------------
    txprbsforceerr_in                       : in   std_logic;
    ---------------------- Transmit Ports - TX Buffer Ports --------------------
    txbufstatus_out                         : out  std_logic_vector(1 downto 0);
    --------------- Transmit Ports - TX Configurable Driver Ports --------------
    txdiffctrl_in                           : in   std_logic_vector(3 downto 0);
    txinhibit_in                            : in   std_logic;
    txmaincursor_in                         : in   std_logic_vector(6 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    txdata_in                               : in   std_logic_vector(31 downto 0);
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    gthtxn_out                              : out  std_logic;
    gthtxp_out                              : out  std_logic;
    ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    txoutclk_out                            : out  std_logic;
    txoutclkfabric_out                      : out  std_logic;
    txoutclkpcs_out                         : out  std_logic;
    --------------------- Transmit Ports - TX Gearbox Ports --------------------
    txsequence_in                           : in   std_logic_vector(6 downto 0);
    ------------- Transmit Ports - TX Initialization and Reset Ports -----------
    txpcsreset_in                           : in   std_logic;
    txpmareset_in                           : in   std_logic;
    txresetdone_out                         : out  std_logic;
    ----------------- Transmit Ports - TX Polarity Control Ports ---------------
    txpolarity_in                           : in   std_logic;
    ------------------ Transmit Ports - pattern Generator Ports ----------------
    txprbssel_in                            : in   std_logic_vector(2 downto 0)


);


end bd_2_ten_gig_eth_pcs_pma_0_gtwizard_gth_10gbaser_GT;

architecture RTL of bd_2_ten_gig_eth_pcs_pma_0_gtwizard_gth_10gbaser_GT is
    
--**************************** Signal Declarations ****************************


    -- ground and tied_to_vcc_i signals
    signal  tied_to_ground_i                :   std_logic;
    signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   :   std_logic;



    -- RX Datapath signals
    signal rxdata_i                         :   std_logic_vector(63 downto 0);      
    signal rxchariscomma_float_i            :   std_logic_vector(5 downto 0);
    signal rxcharisk_float_i                :   std_logic_vector(5 downto 0);
    signal rxdisperr_float_i                :   std_logic_vector(5 downto 0);
    signal rxnotintable_float_i             :   std_logic_vector(5 downto 0);
    signal rxrundisp_float_i                :   std_logic_vector(5 downto 0);


    -- TX Datapath signals
    signal txdata_i                         :   std_logic_vector(63 downto 0);
    signal txkerr_float_i                   :   std_logic_vector(5 downto 0);
    signal txrundisp_float_i                :   std_logic_vector(5 downto 0);
    signal rxheader_float_i                 :   std_logic_vector(3 downto 0);
    signal rxheadervalid_float_i            :   std_logic;
    signal rxdatavalid_float_i              :   std_logic;
       
 
--******************************** Main Body of Code***************************
                       
begin                      

    ---------------------------  Static signal Assignments ---------------------   

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';

    -------------------  GT Datapath byte mapping  -----------------

    --The GT deserializes the rightmost parallel bit (LSb) first
    rxdata_out    <=   rxdata_i(31 downto 0);

    --The GT serializes the rightmost parallel bit (LSb) first
    txdata_i <=   (tied_to_ground_vec_i(31 downto 0) & txdata_in); 



    ----------------------------- GTHE2 Instance  --------------------------   

    gthe2_i : GTHE2_CHANNEL
    generic map
    (

        --_______________________ Simulation-Only Attributes ___________________

        SIM_RECEIVER_DETECT_PASS   =>      ("TRUE"),
        SIM_RESET_SPEEDUP          =>      (GT_SIM_GTRESET_SPEEDUP),
        SIM_TX_EIDLE_DRIVE_LEVEL   =>      ("X"),
        SIM_CPLLREFCLK_SEL         =>      ("001"),
        SIM_VERSION                =>      ("2.0"),
        

       ------------------RX Byte and Word Alignment Attributes---------------
        ALIGN_COMMA_DOUBLE                      =>     ("FALSE"),
        ALIGN_COMMA_ENABLE                      =>     ("0001111111"),
        ALIGN_COMMA_WORD                        =>     (1),
        ALIGN_MCOMMA_DET                        =>     ("FALSE"),
        ALIGN_MCOMMA_VALUE                      =>     ("1010000011"),
        ALIGN_PCOMMA_DET                        =>     ("FALSE"),
        ALIGN_PCOMMA_VALUE                      =>     ("0101111100"),
        SHOW_REALIGN_COMMA                      =>     ("TRUE"),
        RXSLIDE_AUTO_WAIT                       =>     (7),
        RXSLIDE_MODE                            =>     ("OFF"),
        RX_SIG_VALID_DLY                        =>     (10),

       ------------------RX 8B/10B Decoder Attributes---------------
        RX_DISPERR_SEQ_MATCH                    =>     ("TRUE"),
        DEC_MCOMMA_DETECT                       =>     ("FALSE"),
        DEC_PCOMMA_DETECT                       =>     ("FALSE"),
        DEC_VALID_COMMA_ONLY                    =>     ("FALSE"),

       ------------------------RX Clock Correction Attributes----------------------
        CBCC_DATA_SOURCE_SEL                    =>     ("DECODED"),
        CLK_COR_SEQ_2_USE                       =>     ("FALSE"),
        CLK_COR_KEEP_IDLE                       =>     ("FALSE"),
        CLK_COR_MAX_LAT                         =>     (19),
        CLK_COR_MIN_LAT                         =>     (15),
        CLK_COR_PRECEDENCE                      =>     ("TRUE"),
        CLK_COR_REPEAT_WAIT                     =>     (0),
        CLK_COR_SEQ_LEN                         =>     (1),
        CLK_COR_SEQ_1_ENABLE                    =>     ("1111"),
        CLK_COR_SEQ_1_1                         =>     ("0000000000"),
        CLK_COR_SEQ_1_2                         =>     ("0000000000"),
        CLK_COR_SEQ_1_3                         =>     ("0000000000"),
        CLK_COR_SEQ_1_4                         =>     ("0000000000"),
        CLK_CORRECT_USE                         =>     ("FALSE"),
        CLK_COR_SEQ_2_ENABLE                    =>     ("1111"),
        CLK_COR_SEQ_2_1                         =>     ("0000000000"),
        CLK_COR_SEQ_2_2                         =>     ("0000000000"),
        CLK_COR_SEQ_2_3                         =>     ("0000000000"),
        CLK_COR_SEQ_2_4                         =>     ("0000000000"),

       ------------------------RX Channel Bonding Attributes----------------------
        CHAN_BOND_KEEP_ALIGN                    =>     ("FALSE"),
        CHAN_BOND_MAX_SKEW                      =>     (1),
        CHAN_BOND_SEQ_LEN                       =>     (1),
        CHAN_BOND_SEQ_1_1                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_2                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_3                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_4                       =>     ("0000000000"),
        CHAN_BOND_SEQ_1_ENABLE                  =>     ("1111"),
        CHAN_BOND_SEQ_2_1                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_2                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_3                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_4                       =>     ("0000000000"),
        CHAN_BOND_SEQ_2_ENABLE                  =>     ("1111"),
        CHAN_BOND_SEQ_2_USE                     =>     ("FALSE"),
        FTS_DESKEW_SEQ_ENABLE                   =>     ("1111"),
        FTS_LANE_DESKEW_CFG                     =>     ("1111"),
        FTS_LANE_DESKEW_EN                      =>     ("FALSE"),

       ---------------------------RX Margin Analysis Attributes----------------------------
        ES_CONTROL                              =>     ("000000"),
        ES_ERRDET_EN                            =>     ("FALSE"),
        ES_EYE_SCAN_EN                          =>     ("TRUE"),
        ES_HORZ_OFFSET                          =>     (x"000"),
        ES_PMA_CFG                              =>     ("0000000000"),
        ES_PRESCALE                             =>     ("00000"),
        ES_QUALIFIER                            =>     (x"00000000000000000000"),
        ES_QUAL_MASK                            =>     (x"00000000000000000000"),
        ES_SDATA_MASK                           =>     (x"00000000000000000000"),
        ES_VERT_OFFSET                          =>     ("000000000"),

       -------------------------FPGA RX Interface Attributes-------------------------
        RX_DATA_WIDTH                           =>     (32),

       ---------------------------PMA Attributes----------------------------
        OUTREFCLK_SEL_INV                       =>     ("11"),
        PMA_RSV                                 =>     (x"00000080"),
        PMA_RSV2                                =>     (x"1C00000A"),
        PMA_RSV3                                =>     ("00"),
        PMA_RSV4                                =>     (x"0008"),
        RX_BIAS_CFG                             =>     ("000011000000000000010000"),
        DMONITOR_CFG                            =>     (x"000A00"),
        RX_CM_SEL                               =>     ("11"),
        RX_CM_TRIM                              =>     ("1010"),
        RX_DEBUG_CFG                            =>     ("00000000000000"),
        RX_OS_CFG                               =>     ("0000010000000"),
        TERM_RCAL_CFG                           =>     ("100001000010000"),
        TERM_RCAL_OVRD                          =>     ("000"),
        TST_RSV                                 =>     (x"00000000"),
        RX_CLK25_DIV                            =>     (7),
        TX_CLK25_DIV                            =>     (7),
        UCODEER_CLR                             =>     ('0'),

       ---------------------------PCI Express Attributes----------------------------
        PCS_PCIE_EN                             =>     ("FALSE"),

       ---------------------------PCS Attributes----------------------------
        PCS_RSVD_ATTR                           =>     (x"000000000000"),

       -------------RX Buffer Attributes------------
        RXBUF_ADDR_MODE                         =>     ("FAST"),
        RXBUF_EIDLE_HI_CNT                      =>     ("1000"),
        RXBUF_EIDLE_LO_CNT                      =>     ("0000"),
        RXBUF_EN                                =>     ("TRUE"),
        RX_BUFFER_CFG                           =>     ("000000"),
        RXBUF_RESET_ON_CB_CHANGE                =>     ("TRUE"),
        RXBUF_RESET_ON_COMMAALIGN               =>     ("FALSE"),
        RXBUF_RESET_ON_EIDLE                    =>     ("FALSE"),
        RXBUF_RESET_ON_RATE_CHANGE              =>     ("TRUE"),
        RXBUFRESET_TIME                         =>     ("00001"),
        RXBUF_THRESH_OVFLW                      =>     (61),
        RXBUF_THRESH_OVRD                       =>     ("FALSE"),
        RXBUF_THRESH_UNDFLW                     =>     (4),
        RXDLY_CFG                               =>     (x"001F"),
        RXDLY_LCFG                              =>     (x"030"),
        RXDLY_TAP_CFG                           =>     (x"0000"),
        RXPH_CFG                                =>     (x"C00002"),
        RXPHDLY_CFG                             =>     (x"084020"),
        RXPH_MONITOR_SEL                        =>     ("00000"),
        RX_XCLK_SEL                             =>     ("RXREC"),
        RX_DDI_SEL                              =>     ("000000"),
        RX_DEFER_RESET_BUF_EN                   =>     ("TRUE"),

       -----------------------CDR Attributes-------------------------

        RXCDR_CFG                               =>     (x"0002007FE2000C208001A"),
        RXCDR_FR_RESET_ON_EIDLE                 =>     ('0'),
        RXCDR_HOLD_DURING_EIDLE                 =>     ('0'),
        RXCDR_PH_RESET_ON_EIDLE                 =>     ('0'),
        RXCDR_LOCK_CFG                          =>     ("010101"),

       -------------------RX Initialization and Reset Attributes-------------------
        RXCDRFREQRESET_TIME                     =>     ("00001"),
        RXCDRPHRESET_TIME                       =>     ("00001"),
        RXISCANRESET_TIME                       =>     ("00001"),
        RXPCSRESET_TIME                         =>     ("00001"),
        RXPMARESET_TIME                         =>     ("00011"),

       -------------------RX OOB Signaling Attributes-------------------
        RXOOB_CFG                               =>     ("0000110"),

       -------------------------RX Gearbox Attributes---------------------------
        RXGEARBOX_EN                            =>     ("TRUE"),
        GEARBOX_MODE                            =>     ("001"),

       -------------------------PRBS Detection Attribute-----------------------
        RXPRBS_ERR_LOOPBACK                     =>     ('0'),

       -------------Power-Down Attributes----------
        PD_TRANS_TIME_FROM_P2                   =>     (x"03c"),
        PD_TRANS_TIME_NONE_P2                   =>     (x"19"),
        PD_TRANS_TIME_TO_P2                     =>     (x"64"),

       -------------RX OOB Signaling Attributes----------
        SAS_MAX_COM                             =>     (64),
        SAS_MIN_COM                             =>     (36),
        SATA_BURST_SEQ_LEN                      =>     ("1111"),
        SATA_BURST_VAL                          =>     ("100"),
        SATA_EIDLE_VAL                          =>     ("100"),
        SATA_MAX_BURST                          =>     (8),
        SATA_MAX_INIT                           =>     (21),
        SATA_MAX_WAKE                           =>     (7),
        SATA_MIN_BURST                          =>     (4),
        SATA_MIN_INIT                           =>     (12),
        SATA_MIN_WAKE                           =>     (4),

       -------------RX Fabric Clock Output Control Attributes----------
        TRANS_TIME_RATE                         =>     (x"0E"),

       --------------TX Buffer Attributes----------------
        TXBUF_EN                                =>     ("TRUE"),
        TXBUF_RESET_ON_RATE_CHANGE              =>     ("TRUE"),
        TXDLY_CFG                               =>     (x"001F"),
        TXDLY_LCFG                              =>     (x"030"),
        TXDLY_TAP_CFG                           =>     (x"0000"),
        TXPH_CFG                                =>     (x"0780"),
        TXPHDLY_CFG                             =>     (x"084020"),
        TXPH_MONITOR_SEL                        =>     ("00000"),
        TX_XCLK_SEL                             =>     ("TXOUT"),

       -------------------------FPGA TX Interface Attributes-------------------------
        TX_DATA_WIDTH                           =>     (32),

       -------------------------TX Configurable Driver Attributes-------------------------
        TX_DEEMPH0                              =>     ("000000"),
        TX_DEEMPH1                              =>     ("000000"),
        TX_EIDLE_ASSERT_DELAY                   =>     ("110"),
        TX_EIDLE_DEASSERT_DELAY                 =>     ("100"),
        TX_LOOPBACK_DRIVE_HIZ                   =>     ("FALSE"),
        TX_MAINCURSOR_SEL                       =>     ('0'),
        TX_DRIVE_MODE                           =>     ("DIRECT"),
        TX_MARGIN_FULL_0                        =>     ("1001110"),
        TX_MARGIN_FULL_1                        =>     ("1001001"),
        TX_MARGIN_FULL_2                        =>     ("1000101"),
        TX_MARGIN_FULL_3                        =>     ("1000010"),
        TX_MARGIN_FULL_4                        =>     ("1000000"),
        TX_MARGIN_LOW_0                         =>     ("1000110"),
        TX_MARGIN_LOW_1                         =>     ("1000100"),
        TX_MARGIN_LOW_2                         =>     ("1000010"),
        TX_MARGIN_LOW_3                         =>     ("1000000"),
        TX_MARGIN_LOW_4                         =>     ("1000000"),

       -------------------------TX Gearbox Attributes--------------------------
        TXGEARBOX_EN                            =>     ("TRUE"),

       -------------------------TX Initialization and Reset Attributes--------------------------
        TXPCSRESET_TIME                         =>     ("00001"),
        TXPMARESET_TIME                         =>     ("00001"),

       -------------------------TX Receiver Detection Attributes--------------------------
        TX_RXDETECT_CFG                         =>     (x"1832"),
        TX_RXDETECT_REF                         =>     ("100"),

       ----------------------------CPLL Attributes----------------------------
        CPLL_CFG                                =>     (x"00BC07DC"),
        CPLL_FBDIV                              =>     (4),
        CPLL_FBDIV_45                           =>     (5),
        CPLL_INIT_CFG                           =>     (x"00001E"),
        CPLL_LOCK_CFG                           =>     (x"01E8"),
        CPLL_REFCLK_DIV                         =>     (1),
        RXOUT_DIV                               =>     (1),
        TXOUT_DIV                               =>     (1),
        SATA_CPLL_CFG                           =>     ("VCO_3000MHZ"),

       --------------RX Initialization and Reset Attributes-------------
        RXDFELPMRESET_TIME                      =>     ("0001111"),

       --------------RX Equalizer Attributes-------------
        RXLPM_HF_CFG                            =>     ("00001000000000"),
        RXLPM_LF_CFG                            =>     ("001001000000000000"),
        RX_DFE_GAIN_CFG                         =>     (x"0020C0"),
        RX_DFE_H2_CFG                           =>     ("000000000000"),
        RX_DFE_H3_CFG                           =>     ("000001000000"),
        RX_DFE_H4_CFG                           =>     ("00011100000"),
        RX_DFE_H5_CFG                           =>     ("00011100000"),
        RX_DFE_KL_CFG                           =>     ("001000001000000000000001100010000"),
        RX_DFE_LPM_CFG                          =>     (x"0080"),
        RX_DFE_LPM_HOLD_DURING_EIDLE            =>     ('0'),
        RX_DFE_UT_CFG                           =>     ("00011100000000000"),
        RX_DFE_VP_CFG                           =>     ("00011101010100011"),

       -------------------------Power-Down Attributes-------------------------
        RX_CLKMUX_PD                            =>     ('1'),
        TX_CLKMUX_PD                            =>     ('1'),

       -------------------------FPGA RX Interface Attribute-------------------------
        RX_INT_DATAWIDTH                        =>     (1),

       -------------------------FPGA TX Interface Attribute-------------------------
        TX_INT_DATAWIDTH                        =>     (1),

       ------------------TX Configurable Driver Attributes---------------
        TX_QPI_STATUS_EN                        =>     ('0'),

       ------------------ JTAG Attributes ---------------
        ACJTAG_DEBUG_MODE                       =>     ('0'),
        ACJTAG_MODE                             =>     ('0'),
        ACJTAG_RESET                            =>     ('0'),
        ADAPT_CFG0                              =>     (x"00C10"),
        CFOK_CFG                                =>     (x"24800040E80"),
        CFOK_CFG2                               =>     (x"20"),
        CFOK_CFG3                               =>     (x"20"),
        ES_CLK_PHASE_SEL                        =>     ('0'),
        PMA_RSV5                                =>     (x"0"),
        RESET_POWERSAVE_DISABLE                 =>     ('0'),
        USE_PCS_CLK_PHASE_SEL                   =>     ('0'),
        A_RXOSCALRESET                          =>     ('0'),

       ------------------ RX Phase Interpolator Attributes---------------
        RXPI_CFG0                               =>     ("00"),
        RXPI_CFG1                               =>     ("11"),
        RXPI_CFG2                               =>     ("11"),
        RXPI_CFG3                               =>     ("11"),
        RXPI_CFG4                               =>     ('0'),
        RXPI_CFG5                               =>     ('0'),
        RXPI_CFG6                               =>     ("100"),

       --------------RX Decision Feedback Equalizer(DFE)-------------
        RX_DFELPM_CFG0                          =>     ("0110"),
        RX_DFELPM_CFG1                          =>     ('0'),
        RX_DFELPM_KLKH_AGC_STUP_EN              =>     ('1'),
        RX_DFE_AGC_CFG0                         =>     ("00"),
        RX_DFE_AGC_CFG1                         =>     ("100"),
        RX_DFE_AGC_CFG2                         =>     ("0000"),
        RX_DFE_AGC_OVRDEN                       =>     ('1'),
        RX_DFE_H6_CFG                           =>     (x"020"),
        RX_DFE_H7_CFG                           =>     (x"020"),
        RX_DFE_KL_LPM_KH_CFG0                   =>     ("01"),
        RX_DFE_KL_LPM_KH_CFG1                   =>     ("010"),
        RX_DFE_KL_LPM_KH_CFG2                   =>     ("0010"),
        RX_DFE_KL_LPM_KH_OVRDEN                 =>     ('1'),
        RX_DFE_KL_LPM_KL_CFG0                   =>     ("10"),
        RX_DFE_KL_LPM_KL_CFG1                   =>     ("010"),
        RX_DFE_KL_LPM_KL_CFG2                   =>     ("0010"),
        RX_DFE_KL_LPM_KL_OVRDEN                 =>     ('1'),
        RX_DFE_ST_CFG                           =>     (x"00E100000C003F"),

       ------------------ TX Phase Interpolator Attributes---------------
        TXPI_CFG0                               =>     ("00"),
        TXPI_CFG1                               =>     ("00"),
        TXPI_CFG2                               =>     ("00"),
        TXPI_CFG3                               =>     ('0'),
        TXPI_CFG4                               =>     ('0'),
        TXPI_CFG5                               =>     ("100"),
        TXPI_GREY_SEL                           =>     ('0'),
        TXPI_INVSTROBE_SEL                      =>     ('0'),
        TXPI_PPMCLK_SEL                         =>     ("TXUSRCLK2"),
        TXPI_PPM_CFG                            =>     (x"00"),
        TXPI_SYNFREQ_PPM                        =>     ("000"),
        TX_RXDETECT_PRECHARGE_TIME              =>     (x"155CC"),

       ------------------ LOOPBACK Attributes---------------
        LOOPBACK_CFG                            =>     ('0'),

       ------------------RX OOB Signalling Attributes---------------
        RXOOB_CLK_CFG                           =>     ("PMA"),

       ------------------ CDR Attributes ---------------
        RXOSCALRESET_TIME                       =>     ("00011"),
        RXOSCALRESET_TIMEOUT                    =>     ("00000"),

       ------------------TX OOB Signalling Attributes---------------
        TXOOB_CFG                               =>     ('0'),

       ------------------RX Buffer Attributes---------------
        RXSYNC_MULTILANE                        =>     ('0'),
        RXSYNC_OVRD                             =>     ('0'),
        RXSYNC_SKIP_DA                          =>     ('0'),

       ------------------TX Buffer Attributes---------------
        TXSYNC_MULTILANE                        =>     (TXSYNC_MULTILANE_IN),
        TXSYNC_OVRD                             =>     (TXSYNC_OVRD_IN),
        TXSYNC_SKIP_DA                          =>     ('0')


    )
    port map
    (
        --------------------------------- CPLL Ports -------------------------------
        CPLLFBCLKLOST                   =>      open,
        CPLLLOCK                        =>      open,
        CPLLLOCKDETCLK                  =>      tied_to_ground_i,
        CPLLLOCKEN                      =>      tied_to_vcc_i,
        CPLLPD                          =>      tied_to_vcc_i,
        CPLLREFCLKLOST                  =>      open,
        CPLLREFCLKSEL                   =>      "001",
        CPLLRESET                       =>      tied_to_ground_i,
        GTRSVD                          =>      "0000000000000000",
        PCSRSVDIN                       =>      "0000000000000000",
        PCSRSVDIN2                      =>      "00000",
        PMARSVDIN                       =>      "00000",
        TSTIN                           =>      "11111111111111111111",
        -------------------------- Channel - Clocking Ports ------------------------
        GTGREFCLK                       =>      tied_to_ground_i,
        GTNORTHREFCLK0                  =>      tied_to_ground_i,
        GTNORTHREFCLK1                  =>      tied_to_ground_i,
        GTREFCLK0                       =>      tied_to_ground_i,
        GTREFCLK1                       =>      tied_to_ground_i,
        GTSOUTHREFCLK0                  =>      tied_to_ground_i,
        GTSOUTHREFCLK1                  =>      tied_to_ground_i,
        ---------------------------- Channel - DRP Ports  --------------------------
        DRPADDR                         =>      drpaddr_in,
        DRPCLK                          =>      drpclk_in,
        DRPDI                           =>      drpdi_in,
        DRPDO                           =>      drpdo_out,
        DRPEN                           =>      drpen_in,
        DRPRDY                          =>      drprdy_out,
        DRPWE                           =>      drpwe_in,
        ------------------------------- Clocking Ports -----------------------------
        GTREFCLKMONITOR                 =>      open,
        QPLLCLK                         =>      qpllclk_in,
        QPLLREFCLK                      =>      qpllrefclk_in,
        RXSYSCLKSEL                     =>      "11",
        TXSYSCLKSEL                     =>      "11",
        ----------------- FPGA TX Interface Datapath Configuration  ----------------
        TX8B10BEN                       =>      tied_to_ground_i,
        ------------------------------- Loopback Ports -----------------------------
        LOOPBACK                        =>      loopback_in,
        ----------------------------- PCI Express Ports ----------------------------
        PHYSTATUS                       =>      open,
        RXRATE                          =>      rxrate_in,
        RXVALID                         =>      open,
        ------------------------------ Power-Down Ports ----------------------------
        RXPD                            =>      "00",
        TXPD                            =>      "00",
        -------------------------- RX 8B/10B Decoder Ports -------------------------
        SETERRSTATUS                    =>      tied_to_ground_i,
        --------------------- RX Initialization and Reset Ports --------------------
        EYESCANRESET                    =>      eyescanreset_in,
        RXUSERRDY                       =>      rxuserrdy_in,
        -------------------------- RX Margin Analysis Ports ------------------------
        EYESCANDATAERROR                =>      eyescandataerror_out,
        EYESCANMODE                     =>      tied_to_ground_i,
        EYESCANTRIGGER                  =>      eyescantrigger_in,
        ------------------------------- Receive Ports ------------------------------
        CLKRSVD0                        =>      tied_to_ground_i,
        CLKRSVD1                        =>      tied_to_ground_i,
        DMONFIFORESET                   =>      tied_to_ground_i,
        DMONITORCLK                     =>      tied_to_ground_i,
        RXPMARESETDONE                  =>      rxpmaresetdone_out,
        RXRATEMODE                      =>      tied_to_ground_i,
        SIGVALIDCLK                     =>      tied_to_ground_i,
        TXPMARESETDONE                  =>      open,
        -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        RXSTARTOFSEQ                    =>      open,
        ------------------------- Receive Ports - CDR Ports ------------------------
        RXCDRFREQRESET                  =>      tied_to_ground_i,
        RXCDRHOLD                       =>      rxcdrhold_in,
        RXCDRLOCK                       =>      open,
        RXCDROVRDEN                     =>      tied_to_ground_i,
        RXCDRRESET                      =>      tied_to_ground_i,
        RXCDRRESETRSV                   =>      tied_to_ground_i,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        RXCLKCORCNT                     =>      open,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        RXSLIDE                         =>      tied_to_ground_i,
        ------------------- Receive Ports - Digital Monitor Ports ------------------
        DMONITOROUT                     =>      dmonitorout_out,
        ---------- Receive Ports - FPGA RX Interface Datapath Configuration --------
        RX8B10BEN                       =>      tied_to_ground_i,
        ------------------ Receive Ports - FPGA RX Interface Ports -----------------
        RXUSRCLK                        =>      rxusrclk_in,
        RXUSRCLK2                       =>      rxusrclk2_in,
        ------------------ Receive Ports - FPGA RX interface Ports -----------------
        RXDATA                          =>      rxdata_i,
        ------------------- Receive Ports - Pattern Checker Ports ------------------
        RXPRBSERR                       =>      rxprbserr_out,
        RXPRBSSEL                       =>      rxprbssel_in,
        ------------------- Receive Ports - Pattern Checker ports ------------------
        RXPRBSCNTRESET                  =>      rxprbscntreset_in,
        ------------------ Receive Ports - RX 8B/10B Decoder Ports -----------------
        RXDISPERR                       =>      open,
        RXNOTINTABLE                    =>      open,
        ------------------------ Receive Ports - RX AFE Ports ----------------------
        GTHRXN                          =>      gthrxn_in,
        ------------------- Receive Ports - RX Buffer Bypass Ports -----------------
        RXBUFRESET                      =>      rxbufreset_in,
        RXBUFSTATUS                     =>      rxbufstatus_out,
        RXDDIEN                         =>      tied_to_ground_i,
        RXDLYBYPASS                     =>      tied_to_vcc_i,
        RXDLYEN                         =>      tied_to_ground_i,
        RXDLYOVRDEN                     =>      tied_to_ground_i,
        RXDLYSRESET                     =>      tied_to_ground_i,
        RXDLYSRESETDONE                 =>      open,
        RXPHALIGN                       =>      tied_to_ground_i,
        RXPHALIGNDONE                   =>      open,
        RXPHALIGNEN                     =>      tied_to_ground_i,
        RXPHDLYPD                       =>      tied_to_ground_i,
        RXPHDLYRESET                    =>      tied_to_ground_i,
        RXPHMONITOR                     =>      open,
        RXPHOVRDEN                      =>      tied_to_ground_i,
        RXPHSLIPMONITOR                 =>      open,
        RXSTATUS                        =>      open,
        RXSYNCALLIN                     =>      tied_to_ground_i,
        RXSYNCDONE                      =>      open,
        RXSYNCIN                        =>      tied_to_ground_i,
        RXSYNCMODE                      =>      tied_to_ground_i,
        RXSYNCOUT                       =>      open,
        -------------- Receive Ports - RX Byte and Word Alignment Ports ------------
        RXBYTEISALIGNED                 =>      open,
        RXBYTEREALIGN                   =>      open,
        RXCOMMADET                      =>      open,
        RXCOMMADETEN                    =>      tied_to_ground_i,
        RXMCOMMAALIGNEN                 =>      tied_to_ground_i,
        RXPCOMMAALIGNEN                 =>      tied_to_ground_i,
        ------------------ Receive Ports - RX Channel Bonding Ports ----------------
        RXCHANBONDSEQ                   =>      open,
        RXCHBONDEN                      =>      tied_to_ground_i,
        RXCHBONDLEVEL                   =>      tied_to_ground_vec_i(2 downto 0),
        RXCHBONDMASTER                  =>      tied_to_ground_i,
        RXCHBONDO                       =>      open,
        RXCHBONDSLAVE                   =>      tied_to_ground_i,
        ----------------- Receive Ports - RX Channel Bonding Ports  ----------------
        RXCHANISALIGNED                 =>      open,
        RXCHANREALIGN                   =>      open,
        ------------ Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
        RSOSINTDONE                     =>      open,
        RXDFESLIDETAPOVRDEN             =>      tied_to_ground_i,
        RXOSCALRESET                    =>      tied_to_ground_i,
        --------------------- Receive Ports - RX Equalizer Ports -------------------
        RXLPMHFHOLD                     =>      tied_to_ground_i,
        RXLPMHFOVRDEN                   =>      tied_to_ground_i,
        RXLPMLFHOLD                     =>      tied_to_ground_i,
        --------------------- Receive Ports - RX Equalizer Ports -------------------
        RXDFESLIDETAPSTARTED            =>      open,
        RXDFESLIDETAPSTROBEDONE         =>      open,
        RXDFESLIDETAPSTROBESTARTED      =>      open,
        --------------------- Receive Ports - RX Equalizer Ports -------------------
        RXADAPTSELTEST                  =>      tied_to_ground_vec_i(13 downto 0),
        RXDFEAGCHOLD                    =>      rxdfeagchold_in,
        RXDFEAGCOVRDEN                  =>      tied_to_ground_i,
        RXDFEAGCTRL                     =>      "10000",
        RXDFECM1EN                      =>      tied_to_ground_i,
        RXDFELFHOLD                     =>      tied_to_ground_i,
        RXDFELFOVRDEN                   =>      tied_to_ground_i,
        RXDFELPMRESET                   =>      rxdfelpmreset_in,
        RXDFESLIDETAP                   =>      tied_to_ground_vec_i(4 downto 0),
        RXDFESLIDETAPADAPTEN            =>      tied_to_ground_i,
        RXDFESLIDETAPHOLD               =>      tied_to_ground_i,
        RXDFESLIDETAPID                 =>      tied_to_ground_vec_i(5 downto 0),
        RXDFESLIDETAPINITOVRDEN         =>      tied_to_ground_i,
        RXDFESLIDETAPONLYADAPTEN        =>      tied_to_ground_i,
        RXDFESLIDETAPSTROBE             =>      tied_to_ground_i,
        RXDFESTADAPTDONE                =>      open,
        RXDFETAP2HOLD                   =>      tied_to_ground_i,
        RXDFETAP2OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP3HOLD                   =>      tied_to_ground_i,
        RXDFETAP3OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP4HOLD                   =>      tied_to_ground_i,
        RXDFETAP4OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP5HOLD                   =>      tied_to_ground_i,
        RXDFETAP5OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP6HOLD                   =>      tied_to_ground_i,
        RXDFETAP6OVRDEN                 =>      tied_to_ground_i,
        RXDFETAP7HOLD                   =>      tied_to_ground_i,
        RXDFETAP7OVRDEN                 =>      tied_to_ground_i,
        RXDFEUTHOLD                     =>      tied_to_ground_i,
        RXDFEUTOVRDEN                   =>      tied_to_ground_i,
        RXDFEVPHOLD                     =>      tied_to_ground_i,
        RXDFEVPOVRDEN                   =>      tied_to_ground_i,
        RXDFEVSEN                       =>      tied_to_ground_i,
        RXDFEXYDEN                      =>      tied_to_vcc_i,
        RXLPMLFKLOVRDEN                 =>      tied_to_ground_i,
        RXMONITOROUT                    =>      open,
        RXMONITORSEL                    =>      "00",
        RXOSHOLD                        =>      tied_to_ground_i,
        RXOSINTCFG                      =>      "0110",
        RXOSINTEN                       =>      tied_to_vcc_i,
        RXOSINTHOLD                     =>      tied_to_ground_i,
        RXOSINTID0                      =>      tied_to_ground_vec_i(3 downto 0),
        RXOSINTNTRLEN                   =>      tied_to_ground_i,
        RXOSINTOVRDEN                   =>      tied_to_ground_i,
        RXOSINTSTARTED                  =>      open,
        RXOSINTSTROBE                   =>      tied_to_ground_i,
        RXOSINTSTROBEDONE               =>      open,
        RXOSINTSTROBESTARTED            =>      open,
        RXOSINTTESTOVRDEN               =>      tied_to_ground_i,
        RXOSOVRDEN                      =>      tied_to_ground_i,
        ------------ Receive Ports - RX Fabric ClocK Output Control Ports ----------
        RXRATEDONE                      =>      open,
        --------------- Receive Ports - RX Fabric Output Control Ports -------------
        RXOUTCLK                        =>      rxoutclk_out,
        RXOUTCLKFABRIC                  =>      open,
        RXOUTCLKPCS                     =>      open,
        RXOUTCLKSEL                     =>      "010",
        ---------------------- Receive Ports - RX Gearbox Ports --------------------
        RXDATAVALID(1)                  =>      rxdatavalid_float_i,
        RXDATAVALID(0)                  =>      rxdatavalid_out,
        RXHEADER(5 downto 2)            =>      rxheader_float_i,
        RXHEADER(1 downto 0)            =>      rxheader_out,
        RXHEADERVALID(1)                =>      rxheadervalid_float_i,
        RXHEADERVALID(0)                =>      rxheadervalid_out,
        --------------------- Receive Ports - RX Gearbox Ports  --------------------
        RXGEARBOXSLIP                   =>      rxgearboxslip_in,
        ------------- Receive Ports - RX Initialization and Reset Ports ------------
        GTRXRESET                       =>      gtrxreset_in,
        RXOOBRESET                      =>      tied_to_ground_i,
        RXPCSRESET                      =>      rxpcsreset_in,
        RXPMARESET                      =>      rxpmareset_in,
        ------------------ Receive Ports - RX Margin Analysis ports ----------------
        RXLPMEN                         =>      rxlpmen_in,
        ------------------- Receive Ports - RX OOB Signaling ports -----------------
        RXCOMSASDET                     =>      open,
        RXCOMWAKEDET                    =>      open,
        ------------------ Receive Ports - RX OOB Signaling ports  -----------------
        RXCOMINITDET                    =>      open,
        ------------------ Receive Ports - RX OOB signalling Ports -----------------
        RXELECIDLE                      =>      open,
        RXELECIDLEMODE                  =>      "11",
        ----------------- Receive Ports - RX Polarity Control Ports ----------------
        RXPOLARITY                      =>      rxpolarity_in,
        ------------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        RXCHARISCOMMA                   =>      open,
        RXCHARISK                       =>      open,
        ------------------ Receive Ports - Rx Channel Bonding Ports ----------------
        RXCHBONDI                       =>      "00000",
        ------------------------ Receive Ports -RX AFE Ports -----------------------
        GTHRXP                          =>      gthrxp_in,
        -------------- Receive Ports -RX Initialization and Reset Ports ------------
        RXRESETDONE                     =>      rxresetdone_out,
        -------------------------------- Rx AFE Ports ------------------------------
        RXQPIEN                         =>      tied_to_ground_i,
        RXQPISENN                       =>      open,
        RXQPISENP                       =>      open,
        --------------------------- TX Buffer Bypass Ports -------------------------
        TXPHDLYTSTCLK                   =>      tied_to_ground_i,
        ------------------------ TX Configurable Driver Ports ----------------------
        TXPOSTCURSOR                    =>      txpostcursor_in,
        TXPOSTCURSORINV                 =>      tied_to_ground_i,
        TXPRECURSOR                     =>      txprecursor_in,
        TXPRECURSORINV                  =>      tied_to_ground_i,
        TXQPIBIASEN                     =>      tied_to_ground_i,
        TXQPISTRONGPDOWN                =>      tied_to_ground_i,
        TXQPIWEAKPUP                    =>      tied_to_ground_i,
        --------------------- TX Initialization and Reset Ports --------------------
        CFGRESET                        =>      tied_to_ground_i,
        GTTXRESET                       =>      gttxreset_in,
        PCSRSVDOUT                      =>      open,
        TXUSERRDY                       =>      txuserrdy_in,
        ----------------- TX Phase Interpolator PPM Controller Ports ---------------
        TXPIPPMEN                       =>      tied_to_ground_i,
        TXPIPPMOVRDEN                   =>      tied_to_ground_i,
        TXPIPPMPD                       =>      tied_to_ground_i,
        TXPIPPMSEL                      =>      tied_to_vcc_i,
        TXPIPPMSTEPSIZE                 =>      tied_to_ground_vec_i(4 downto 0),
        ---------------------- Transceiver Reset Mode Operation --------------------
        GTRESETSEL                      =>      tied_to_ground_i,
        RESETOVRD                       =>      tied_to_ground_i,
        ------------------------------- Transmit Ports -----------------------------
        TXRATEMODE                      =>      tied_to_ground_i,
        -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        TXHEADER(2)                     =>      tied_to_ground_i,
        TXHEADER(1 downto 0)            =>      txheader_in,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        TXCHARDISPMODE                  =>      tied_to_ground_vec_i(7 downto 0),
        TXCHARDISPVAL                   =>      tied_to_ground_vec_i(7 downto 0),
        ------------------ Transmit Ports - FPGA TX Interface Ports ----------------
        TXUSRCLK                        =>      txusrclk_in,
        TXUSRCLK2                       =>      txusrclk2_in,
        --------------------- Transmit Ports - PCI Express Ports -------------------
        TXELECIDLE                      =>      tied_to_ground_i,
        TXMARGIN                        =>      tied_to_ground_vec_i(2 downto 0),
        TXRATE                          =>      tied_to_ground_vec_i(2 downto 0),
        TXSWING                         =>      tied_to_ground_i,
        ------------------ Transmit Ports - Pattern Generator Ports ----------------
        TXPRBSFORCEERR                  =>      txprbsforceerr_in,
        ------------------ Transmit Ports - TX Buffer Bypass Ports -----------------
        TXDLYBYPASS                     =>      tied_to_vcc_i,
        TXDLYEN                         =>      tied_to_ground_i,
        TXDLYHOLD                       =>      tied_to_ground_i,
        TXDLYOVRDEN                     =>      tied_to_ground_i,
        TXDLYSRESET                     =>      tied_to_ground_i,
        TXDLYSRESETDONE                 =>      open,
        TXDLYUPDOWN                     =>      tied_to_ground_i,
        TXPHALIGN                       =>      tied_to_ground_i,
        TXPHALIGNDONE                   =>      open,
        TXPHALIGNEN                     =>      tied_to_ground_i,
        TXPHDLYPD                       =>      tied_to_ground_i,
        TXPHDLYRESET                    =>      tied_to_ground_i,
        TXPHINIT                        =>      tied_to_ground_i,
        TXPHINITDONE                    =>      open,
        TXPHOVRDEN                      =>      tied_to_ground_i,
        TXSYNCALLIN                     =>      tied_to_ground_i,
        TXSYNCDONE                      =>      open,
        TXSYNCIN                        =>      tied_to_ground_i,
        TXSYNCMODE                      =>      tied_to_ground_i,
        TXSYNCOUT                       =>      open,
        ---------------------- Transmit Ports - TX Buffer Ports --------------------
        TXBUFSTATUS                     =>      txbufstatus_out,
        --------------- Transmit Ports - TX Configurable Driver Ports --------------
        TXBUFDIFFCTRL                   =>      "100",
        TXDEEMPH                        =>      tied_to_ground_i,
        TXDIFFCTRL                      =>      txdiffctrl_in,
        TXDIFFPD                        =>      tied_to_ground_i,
        TXINHIBIT                       =>      txinhibit_in,
        TXMAINCURSOR                    =>      txmaincursor_in,
        TXPISOPD                        =>      tied_to_ground_i,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        TXDATA                          =>      txdata_i,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GTHTXN                          =>      gthtxn_out,
        GTHTXP                          =>      gthtxp_out,
        ----------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        TXOUTCLK                        =>      txoutclk_out,
        TXOUTCLKFABRIC                  =>      txoutclkfabric_out,
        TXOUTCLKPCS                     =>      txoutclkpcs_out,
        TXOUTCLKSEL                     =>      "010",
        TXRATEDONE                      =>      open,
        --------------------- Transmit Ports - TX Gearbox Ports --------------------
        TXGEARBOXREADY                  =>      open,
        TXSEQUENCE                      =>      txsequence_in,
        TXSTARTSEQ                      =>      tied_to_ground_i,
        ------------- Transmit Ports - TX Initialization and Reset Ports -----------
        TXPCSRESET                      =>      txpcsreset_in,
        TXPMARESET                      =>      txpmareset_in,
        TXRESETDONE                     =>      txresetdone_out,
        ------------------ Transmit Ports - TX OOB signalling Ports ----------------
        TXCOMFINISH                     =>      open,
        TXCOMINIT                       =>      tied_to_ground_i,
        TXCOMSAS                        =>      tied_to_ground_i,
        TXCOMWAKE                       =>      tied_to_ground_i,
        TXPDELECIDLEMODE                =>      tied_to_ground_i,
        ----------------- Transmit Ports - TX Polarity Control Ports ---------------
        TXPOLARITY                      =>      txpolarity_in,
        --------------- Transmit Ports - TX Receiver Detection Ports  --------------
        TXDETECTRX                      =>      tied_to_ground_i,
        ------------------ Transmit Ports - TX8b/10b Encoder Ports -----------------
        TX8B10BBYPASS                   =>      tied_to_ground_vec_i(7 downto 0),
        ------------------ Transmit Ports - pattern Generator Ports ----------------
        TXPRBSSEL                       =>      txprbssel_in,
        ----------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
        TXCHARISK                       =>      tied_to_ground_vec_i(7 downto 0),
        ----------------------- Tx Configurable Driver  Ports ----------------------
        TXQPISENN                       =>      open,
        TXQPISENP                       =>      open

    );

 end RTL;

