-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #240)
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520
-- VHDL created on Mon Apr  1 13:52:59 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

library twentynm;
use twentynm.twentynm_components.twentynm_fp_mac;

entity i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520 is
    port (
        in_i_address : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_writedata_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_2_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_3_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_2_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_1_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_2_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_1_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_2_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_writedata_3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520;

architecture normal of i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component lsu_top is
        generic (
            ABITS_PER_LMEM_BANK : INTEGER;
            ADDRSPACE : INTEGER := 1;
            ALIGNMENT_BYTES : INTEGER := 64;
            ATOMIC : INTEGER := 0;
            ATOMIC_WIDTH : INTEGER := 3;
            AWIDTH : INTEGER := 33;
            BURSTCOUNT_WIDTH : INTEGER := 5;
            ENABLE_BANKED_MEMORY : INTEGER := 0;
            FORCE_NOP_SUPPORT : INTEGER := 0;
            HIGH_FMAX : INTEGER := 1;
            INPUTFIFO_USEDW_MAXBITS : INTEGER := 5;
            KERNEL_SIDE_MEM_LATENCY : INTEGER := 2;
            LMEM_ADDR_PERMUTATION_STYLE : INTEGER := 0;
            MEMORY_SIDE_MEM_LATENCY : INTEGER := 16;
            MWIDTH : INTEGER := 512;
            MWIDTH_BYTES : INTEGER := 64;
            NUMBER_BANKS : INTEGER := 1;
            PROFILE_ADDR_TOGGLE : INTEGER := 0;
            READ : INTEGER := 0;
            STALLFREE : INTEGER := 0;
            STYLE : STRING := "BURST-COALESCED";
            SYNCHRONIZE_RESET : INTEGER := 1;
            USECACHING : INTEGER := 0;
            USEINPUTFIFO : INTEGER := 0;
            USEOUTPUTFIFO : INTEGER := 1;
            USE_BYTE_EN : INTEGER := 0;
            USE_WRITE_ACK : INTEGER := 0;
            WIDTH : INTEGER := 512;
            WIDTH_BYTES : INTEGER := 64;
            WRITEDATAWIDTH_BYTES : INTEGER := 64
        );
        port (
            avm_readdata : in std_logic_vector(511 downto 0);
            avm_readdatavalid : in std_logic;
            avm_waitrequest : in std_logic;
            avm_writeack : in std_logic;
            clock2x : in std_logic;
            flush : in std_logic;
            i_address : in std_logic_vector(32 downto 0);
            i_atomic_op : in std_logic_vector(2 downto 0);
            i_bitwiseor : in std_logic_vector(32 downto 0);
            i_byteenable : in std_logic_vector(63 downto 0);
            i_cmpdata : in std_logic_vector(511 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            i_writedata : in std_logic_vector(511 downto 0);
            stream_base_addr : in std_logic_vector(32 downto 0);
            stream_reset : in std_logic;
            stream_size : in std_logic_vector(31 downto 0);
            avm_address : out std_logic_vector(32 downto 0);
            avm_burstcount : out std_logic_vector(4 downto 0);
            avm_byteenable : out std_logic_vector(63 downto 0);
            avm_enable : out std_logic;
            avm_read : out std_logic;
            avm_write : out std_logic;
            avm_writedata : out std_logic_vector(511 downto 0);
            o_active : out std_logic;
            o_input_fifo_depth : out std_logic_vector(4 downto 0);
            o_readdata : out std_logic_vector(511 downto 0);
            o_stall : out std_logic;
            o_valid : out std_logic;
            o_writeack : out std_logic;
            profile_avm_burstcount_total_incr : out std_logic_vector(31 downto 0);
            profile_bw_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i33_0gr_x_q : STD_LOGIC_VECTOR (32 downto 0);
    signal dupName_0_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal dupName_1_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal dupName_2_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal dupName_3_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal addr_trunc_in : STD_LOGIC_VECTOR (32 downto 0);
    signal addr_trunc_q : STD_LOGIC_VECTOR (32 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_0gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i512_0gr_q : STD_LOGIC_VECTOR (511 downto 0);
    signal c_i64_1gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_atomic_op : STD_LOGIC_VECTOR (2 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_bitwiseor : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_cmpdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_base_addr : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_input_fifo_depth : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_writeack_bitsignaltemp : std_logic;
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_profile_avm_burstcount_total_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_profile_bw_incr : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i32_0gr(CONSTANT,22)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_3_dsdk_ip_adapt_bitjoin_x(BITJOIN,14)
    dupName_3_dsdk_ip_adapt_bitjoin_x_q <= in_i_writedata_3_3 & in_i_writedata_2_3 & in_i_writedata_1_3 & in_i_writedata_0_3;

    -- dupName_2_dsdk_ip_adapt_bitjoin_x(BITJOIN,11)
    dupName_2_dsdk_ip_adapt_bitjoin_x_q <= in_i_writedata_3_2 & in_i_writedata_2_2 & in_i_writedata_1_2 & in_i_writedata_0_2;

    -- dupName_1_dsdk_ip_adapt_bitjoin_x(BITJOIN,8)
    dupName_1_dsdk_ip_adapt_bitjoin_x_q <= in_i_writedata_3_1 & in_i_writedata_2_1 & in_i_writedata_1_1 & in_i_writedata_0_1;

    -- dupName_0_dsdk_ip_adapt_bitjoin_x(BITJOIN,4)
    dupName_0_dsdk_ip_adapt_bitjoin_x_q <= in_i_writedata_3_0 & in_i_writedata_2_0 & in_i_writedata_1_0 & in_i_writedata_0_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,27)
    dsdk_ip_adapt_bitjoin_q <= dupName_3_dsdk_ip_adapt_bitjoin_x_q & dupName_2_dsdk_ip_adapt_bitjoin_x_q & dupName_1_dsdk_ip_adapt_bitjoin_x_q & dupName_0_dsdk_ip_adapt_bitjoin_x_q;

    -- c_i512_0gr(CONSTANT,25)
    c_i512_0gr_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- c_i64_1gr(CONSTANT,26)
    c_i64_1gr_q <= "1111111111111111111111111111111111111111111111111111111111111111";

    -- dupName_0_c_i33_0gr_x(CONSTANT,3)
    dupName_0_c_i33_0gr_x_q <= "000000000000000000000000000000000";

    -- c_i3_0gr(CONSTANT,24)
    c_i3_0gr_q <= "000";

    -- addr_trunc(ROUND,20)
    addr_trunc_in <= in_i_address(32 downto 0);
    addr_trunc_q <= addr_trunc_in(32 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521(EXTIFACE,28)
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdata <= in_unnamed_ethash_calculate_dag_item15_avm_readdata;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid <= in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest <= in_unnamed_ethash_calculate_dag_item15_avm_waitrequest;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack <= in_unnamed_ethash_calculate_dag_item15_avm_writeack;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x <= GND_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush <= in_flush;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_address <= addr_trunc_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_atomic_op <= c_i3_0gr_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_bitwiseor <= dupName_0_c_i33_0gr_x_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_byteenable <= c_i64_1gr_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_cmpdata <= c_i512_0gr_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate <= in_i_predicate;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall <= in_i_stall;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid <= in_i_valid;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_writedata <= dsdk_ip_adapt_bitjoin_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_base_addr <= dupName_0_c_i33_0gr_x_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset <= GND_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_size <= c_i32_0gr_q;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset_bitsignaltemp <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset(0);
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid_bitsignaltemp;
    i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_writeack(0) <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_writeack_bitsignaltemp;
    thei_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521 : lsu_top
    GENERIC MAP (
        ABITS_PER_LMEM_BANK => 0,
        ADDRSPACE => 1,
        ALIGNMENT_BYTES => 64,
        ATOMIC => 0,
        ATOMIC_WIDTH => 3,
        AWIDTH => 33,
        BURSTCOUNT_WIDTH => 5,
        ENABLE_BANKED_MEMORY => 0,
        FORCE_NOP_SUPPORT => 0,
        HIGH_FMAX => 1,
        INPUTFIFO_USEDW_MAXBITS => 5,
        KERNEL_SIDE_MEM_LATENCY => 2,
        LMEM_ADDR_PERMUTATION_STYLE => 0,
        MEMORY_SIDE_MEM_LATENCY => 16,
        MWIDTH => 512,
        MWIDTH_BYTES => 64,
        NUMBER_BANKS => 1,
        PROFILE_ADDR_TOGGLE => 0,
        READ => 0,
        STALLFREE => 0,
        STYLE => "BURST-COALESCED",
        SYNCHRONIZE_RESET => 1,
        USECACHING => 0,
        USEINPUTFIFO => 0,
        USEOUTPUTFIFO => 1,
        USE_BYTE_EN => 0,
        USE_WRITE_ACK => 0,
        WIDTH => 512,
        WIDTH_BYTES => 64,
        WRITEDATAWIDTH_BYTES => 64
    )
    PORT MAP (
        avm_readdata => in_unnamed_ethash_calculate_dag_item15_avm_readdata,
        avm_readdatavalid => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writeack_bitsignaltemp,
        clock2x => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_clock2x_bitsignaltemp,
        flush => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_flush_bitsignaltemp,
        i_address => addr_trunc_q,
        i_atomic_op => c_i3_0gr_q,
        i_bitwiseor => dupName_0_c_i33_0gr_x_q,
        i_byteenable => c_i64_1gr_q,
        i_cmpdata => c_i512_0gr_q,
        i_predicate => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_predicate_bitsignaltemp,
        i_stall => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_stall_bitsignaltemp,
        i_valid => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_i_valid_bitsignaltemp,
        i_writedata => dsdk_ip_adapt_bitjoin_q,
        stream_base_addr => dupName_0_c_i33_0gr_x_q,
        stream_reset => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_stream_reset_bitsignaltemp,
        stream_size => c_i32_0gr_q,
        avm_address => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_address,
        avm_burstcount => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_burstcount,
        avm_byteenable => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_byteenable,
        avm_enable => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable_bitsignaltemp,
        avm_read => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read_bitsignaltemp,
        avm_write => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write_bitsignaltemp,
        avm_writedata => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writedata,
        o_active => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active_bitsignaltemp,
        o_stall => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall_bitsignaltemp,
        o_valid => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid_bitsignaltemp,
        o_writeack => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_writeack_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,6)
    out_unnamed_ethash_calculate_dag_item15_avm_address <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_address;

    -- dupName_0_sync_out_x(GPOUT,7)@3
    out_o_valid <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_valid;

    -- dupName_1_regfree_osync_x(GPOUT,10)
    out_unnamed_ethash_calculate_dag_item15_avm_burstcount <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_burstcount;

    -- dupName_2_regfree_osync_x(GPOUT,13)
    out_unnamed_ethash_calculate_dag_item15_avm_byteenable <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_byteenable;

    -- dupName_3_regfree_osync_x(GPOUT,16)
    out_unnamed_ethash_calculate_dag_item15_avm_enable <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_enable;

    -- dupName_4_regfree_osync_x(GPOUT,17)
    out_unnamed_ethash_calculate_dag_item15_avm_read <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_read;

    -- dupName_5_regfree_osync_x(GPOUT,18)
    out_unnamed_ethash_calculate_dag_item15_avm_write <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_write;

    -- dupName_6_regfree_osync_x(GPOUT,19)
    out_unnamed_ethash_calculate_dag_item15_avm_writedata <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_avm_writedata;

    -- regfree_osync(GPOUT,30)
    out_lsu_unnamed_ethash_calculate_dag_item15_o_active <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_active;

    -- sync_out(GPOUT,32)@20000000
    out_o_stall <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item521_o_stall;

END normal;
