###############################################################
#  Generated by:      Cadence Innovus 20.15-s105_1
#  OS:                Linux x86_64(Host ID ee28)
#  Generated on:      Thu Nov 28 14:24:56 2024
#  Design:            CHIP
#  Command:           create_ccopt_clock_tree_spec -file CHIP.CCOPT.spec -keep_all_sdc_clocks
###############################################################
#-------------------------------------------------------------------------------
# Clock tree setup script - dialect: Innovus
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

if { [get_ccopt_clock_trees] != {} } {
  error {Cannot run clock tree spec: clock trees are already defined.}
}

namespace eval ::ccopt {}
namespace eval ::ccopt::ilm {}
set ::ccopt::ilm::ccoptSpecRestoreData {}
# Start by checking for unflattened ILMs.
# Will flatten if so and then check the db sync.
if { [catch {ccopt_check_and_flatten_ilms_no_restore}] } {
  return -code error
}
# cache the value of the restore command output by the ILM flattening code
set ::ccopt::ilm::ccoptSpecRestoreData $::ccopt::ilm::ccoptRestoreILMState

# The following pins are clock sources
set_ccopt_property cts_is_sdc_clock_root -pin clk true

# Input pins determined constant across all timing configs.
set_ccopt_property case_analysis -pin I_CLK/PD 0
set_ccopt_property case_analysis -pin I_CLK/PU 0
set_ccopt_property case_analysis -pin I_CLK/SMT 0

# Clocks present at pin clk
#   clk (period 8.900ns) in timing_config func_mode([CHIP_cts.sdc])
create_ccopt_clock_tree -name clk -source clk -no_skew_group

set_ccopt_property source_output_max_trans -delay_corner Delay_Corner_max -early -clock_tree clk 0.500
set_ccopt_property source_output_max_trans -delay_corner Delay_Corner_min -early -clock_tree clk 0.500
set_ccopt_property source_output_max_trans -delay_corner Delay_Corner_max -late -clock_tree clk 0.500
set_ccopt_property source_output_max_trans -delay_corner Delay_Corner_min -late -clock_tree clk 0.500
set_ccopt_property source_max_capacitance -clock_tree clk 0.150
# Clock period setting for source pin of clk
set_ccopt_property clock_period -pin clk 8.9

# Skew group to balance non generated clock:clk in timing_config:func_mode (sdc CHIP_cts.sdc)
create_ccopt_skew_group -name clk/func_mode -sources clk -auto_sinks
set_ccopt_property include_source_latency -skew_group clk/func_mode true
set_ccopt_property extracted_from_clock_name -skew_group clk/func_mode clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group clk/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group clk/func_mode {Delay_Corner_max Delay_Corner_min}


check_ccopt_clock_tree_convergence
# Restore the ILM status if possible
if { [get_ccopt_property auto_design_state_for_ilms] == 0 } {
  if {$::ccopt::ilm::ccoptSpecRestoreData != {} } {
    eval $::ccopt::ilm::ccoptSpecRestoreData
  }
}
