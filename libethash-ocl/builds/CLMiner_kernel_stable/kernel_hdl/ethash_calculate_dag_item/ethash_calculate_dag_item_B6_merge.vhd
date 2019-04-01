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

-- VHDL created from ethash_calculate_dag_item_B6_merge
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

entity ethash_calculate_dag_item_B6_merge is
    port (
        in_c0_exit16937_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_0_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_0_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id38_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe110_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21323_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_236_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit16937_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit16937_1 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit16937_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit16937_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit16937_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit16937_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe110 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21323 : out std_logic_vector(0 downto 0);  -- ufix1
        out_dag_node_pm_236 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B6_merge;

architecture normal of ethash_calculate_dag_item_B6_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exit16937_0(GPOUT,59)
    out_c0_exit16937_0 <= in_c0_exit16937_0_0;

    -- out_c0_exit16937_1(GPOUT,60)
    out_c0_exit16937_1 <= in_c0_exit16937_0_1;

    -- out_c0_exit16937_2(GPOUT,61)
    out_c0_exit16937_2 <= in_c0_exit16937_0_2;

    -- out_c0_exit16937_3(GPOUT,62)
    out_c0_exit16937_3 <= in_c0_exit16937_0_3;

    -- out_c0_exit16937_4(GPOUT,63)
    out_c0_exit16937_4 <= in_c0_exit16937_0_4;

    -- out_c0_exit16937_5(GPOUT,64)
    out_c0_exit16937_5 <= in_c0_exit16937_0_5;

    -- out_c0_exit16937_6(GPOUT,65)
    out_c0_exit16937_6 <= in_c0_exit16937_0_6;

    -- out_c0_exit16937_7(GPOUT,66)
    out_c0_exit16937_7 <= in_c0_exit16937_0_7;

    -- out_c0_exit16937_8(GPOUT,67)
    out_c0_exit16937_8 <= in_c0_exit16937_0_8;

    -- out_c0_exit16937_9(GPOUT,68)
    out_c0_exit16937_9 <= in_c0_exit16937_0_9;

    -- out_c0_exit16937_10(GPOUT,69)
    out_c0_exit16937_10 <= in_c0_exit16937_0_10;

    -- out_c0_exit16937_11(GPOUT,70)
    out_c0_exit16937_11 <= in_c0_exit16937_0_11;

    -- out_c0_exit16937_12(GPOUT,71)
    out_c0_exit16937_12 <= in_c0_exit16937_0_12;

    -- out_c0_exit16937_13(GPOUT,72)
    out_c0_exit16937_13 <= in_c0_exit16937_0_13;

    -- out_c0_exit16937_14(GPOUT,73)
    out_c0_exit16937_14 <= in_c0_exit16937_0_14;

    -- out_c0_exit16937_15(GPOUT,74)
    out_c0_exit16937_15 <= in_c0_exit16937_0_15;

    -- out_c0_exit16937_16(GPOUT,75)
    out_c0_exit16937_16 <= in_c0_exit16937_0_16;

    -- out_c0_exit16937_17(GPOUT,76)
    out_c0_exit16937_17 <= in_c0_exit16937_0_17;

    -- out_c0_exit16937_18(GPOUT,77)
    out_c0_exit16937_18 <= in_c0_exit16937_0_18;

    -- out_c0_exit16937_19(GPOUT,78)
    out_c0_exit16937_19 <= in_c0_exit16937_0_19;

    -- out_c0_exit16937_20(GPOUT,79)
    out_c0_exit16937_20 <= in_c0_exit16937_0_20;

    -- out_c0_exit16937_21(GPOUT,80)
    out_c0_exit16937_21 <= in_c0_exit16937_0_21;

    -- out_c0_exit16937_22(GPOUT,81)
    out_c0_exit16937_22 <= in_c0_exit16937_0_22;

    -- out_c0_exit16937_23(GPOUT,82)
    out_c0_exit16937_23 <= in_c0_exit16937_0_23;

    -- out_c0_exit16937_24(GPOUT,83)
    out_c0_exit16937_24 <= in_c0_exit16937_0_24;

    -- out_c0_exit16937_25(GPOUT,84)
    out_c0_exit16937_25 <= in_c0_exit16937_0_25;

    -- out_c0_exit16937_26(GPOUT,85)
    out_c0_exit16937_26 <= in_c0_exit16937_0_26;

    -- out_c0_exit16937_27(GPOUT,86)
    out_c0_exit16937_27 <= in_c0_exit16937_0_27;

    -- out_c0_exit16937_28(GPOUT,87)
    out_c0_exit16937_28 <= in_c0_exit16937_0_28;

    -- out_c0_exit16937_29(GPOUT,88)
    out_c0_exit16937_29 <= in_c0_exit16937_0_29;

    -- out_c0_exit16937_30(GPOUT,89)
    out_c0_exit16937_30 <= in_c0_exit16937_0_30;

    -- out_c0_exit16937_31(GPOUT,90)
    out_c0_exit16937_31 <= in_c0_exit16937_0_31;

    -- out_c0_exit16937_32(GPOUT,91)
    out_c0_exit16937_32 <= in_c0_exit16937_0_32;

    -- out_c0_exit16937_33(GPOUT,92)
    out_c0_exit16937_33 <= in_c0_exit16937_0_33;

    -- out_c0_exit16937_34(GPOUT,93)
    out_c0_exit16937_34 <= in_c0_exit16937_0_34;

    -- out_c0_exit16937_35(GPOUT,94)
    out_c0_exit16937_35 <= in_c0_exit16937_0_35;

    -- out_c0_exit16937_36(GPOUT,95)
    out_c0_exit16937_36 <= in_c0_exit16937_0_36;

    -- out_c0_exit16937_37(GPOUT,96)
    out_c0_exit16937_37 <= in_c0_exit16937_0_37;

    -- out_c0_exit16937_38(GPOUT,97)
    out_c0_exit16937_38 <= in_c0_exit16937_0_38;

    -- out_c0_exit16937_39(GPOUT,98)
    out_c0_exit16937_39 <= in_c0_exit16937_0_39;

    -- out_c0_exit16937_40(GPOUT,99)
    out_c0_exit16937_40 <= in_c0_exit16937_0_40;

    -- out_c0_exit16937_41(GPOUT,100)
    out_c0_exit16937_41 <= in_c0_exit16937_0_41;

    -- out_c0_exit16937_42(GPOUT,101)
    out_c0_exit16937_42 <= in_c0_exit16937_0_42;

    -- out_c0_exit16937_43(GPOUT,102)
    out_c0_exit16937_43 <= in_c0_exit16937_0_43;

    -- out_c0_exit16937_44(GPOUT,103)
    out_c0_exit16937_44 <= in_c0_exit16937_0_44;

    -- out_c0_exit16937_45(GPOUT,104)
    out_c0_exit16937_45 <= in_c0_exit16937_0_45;

    -- out_c0_exit16937_46(GPOUT,105)
    out_c0_exit16937_46 <= in_c0_exit16937_0_46;

    -- out_c0_exit16937_47(GPOUT,106)
    out_c0_exit16937_47 <= in_c0_exit16937_0_47;

    -- out_c0_exit16937_48(GPOUT,107)
    out_c0_exit16937_48 <= in_c0_exit16937_0_48;

    -- out_c0_exit16937_49(GPOUT,108)
    out_c0_exit16937_49 <= in_c0_exit16937_0_49;

    -- out_c0_exit16937_50(GPOUT,109)
    out_c0_exit16937_50 <= in_c0_exit16937_0_50;

    -- out_acl_hw_wg_id38(GPOUT,110)
    out_acl_hw_wg_id38 <= in_acl_hw_wg_id38_0;

    -- out_c0_exe110(GPOUT,111)
    out_c0_exe110 <= in_c0_exe110_0;

    -- out_c0_exe21323(GPOUT,112)
    out_c0_exe21323 <= in_c0_exe21323_0;

    -- out_dag_node_pm_236(GPOUT,113)
    out_dag_node_pm_236 <= in_dag_node_pm_236_0;

    -- stall_out(LOGICAL,116)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,114)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,115)
    out_valid_out <= in_valid_in_0;

END normal;
