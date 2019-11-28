# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "G_FIFO_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_OPERAND_SIZE" -parent ${Page_0}


}

proc update_PARAM_VALUE.G_FIFO_SIZE { PARAM_VALUE.G_FIFO_SIZE } {
	# Procedure called to update G_FIFO_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_FIFO_SIZE { PARAM_VALUE.G_FIFO_SIZE } {
	# Procedure called to validate G_FIFO_SIZE
	return true
}

proc update_PARAM_VALUE.G_OPERAND_SIZE { PARAM_VALUE.G_OPERAND_SIZE } {
	# Procedure called to update G_OPERAND_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_OPERAND_SIZE { PARAM_VALUE.G_OPERAND_SIZE } {
	# Procedure called to validate G_OPERAND_SIZE
	return true
}


proc update_MODELPARAM_VALUE.G_OPERAND_SIZE { MODELPARAM_VALUE.G_OPERAND_SIZE PARAM_VALUE.G_OPERAND_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_OPERAND_SIZE}] ${MODELPARAM_VALUE.G_OPERAND_SIZE}
}

proc update_MODELPARAM_VALUE.G_FIFO_SIZE { MODELPARAM_VALUE.G_FIFO_SIZE PARAM_VALUE.G_FIFO_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_FIFO_SIZE}] ${MODELPARAM_VALUE.G_FIFO_SIZE}
}

