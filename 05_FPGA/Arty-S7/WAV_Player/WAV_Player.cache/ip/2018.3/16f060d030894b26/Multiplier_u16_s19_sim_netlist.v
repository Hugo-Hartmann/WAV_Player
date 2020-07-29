// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Jul 28 16:32:30 2020
// Host        : DESKTOP-K3B0LAI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Multiplier_u16_s19_sim_netlist.v
// Design      : Multiplier_u16_s19
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Multiplier_u16_s19,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [18:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [34:0]P;

  wire [15:0]A;
  wire [18:0]B;
  wire CLK;
  wire [34:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "19" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "34" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "19" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "34" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "spartan7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [18:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [34:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [15:0]A;
  wire [18:0]B;
  wire CLK;
  wire [34:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "19" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "34" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YLhiMFD42Kcl0RkMojp3uy+UJlffbh5wFU0CJeHRAnMx2HiSlc6ijTGRE9ah+3LcGJ26s08yWKCR
vAM1G51NTpreES2b3Mt2F0MUTMCDZZ9rJk8bPGZLcQgxCddl0/msJnbGF4Z/SMjDXfCxD9oo9uMk
MSPQw8p5/r5GBrOQwDHeXPWOyBG8utnMHs3Vhaa9Bv7dGH4pai/ZkV8uq0BCi4g4PlAS7EFOUp36
xnCsGpCS2xeQ9Jy76bsFKgqQjGSyqMZXxpnoeFwNVbBcRf6swE4tJzwcWGmlhBm9643x4EeV98GE
sWO2Z8ARN9Gt87HSnwm300wyPHmCR7ZCgxrkww==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JvzbzcPZi3pG24cKocpLRSwwEigFUTG6u2qe5X/u3NN5X7UOcwIR9vzVwlFg9RbTUo4P2JGej4/M
lzA5xyTRRvEY5EoW3n+lYiiZBq+LXiPwPt7r7b5qqqBW1ty1zPqZhfTsAG+0nBquuVUQ8fzLONiv
QSds005EMW5DBJS9ZVAdtrKYfZ9e1mIFq60Ht1I/BO4DaPWCl0kM+KhCGxaqtKAFPRL9a5D5a2fk
m+6QFp5hodHNYm8VPDaQSzDuAAf++Ces5LfUbCSbF36QZK5KhyfU3nzFcuFaBo+Q/6xPa8/QSEqo
X3FIf36kLvvngYvj2NlH4Ty0UliG2KnizuHnug==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7200)
`pragma protect data_block
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
d5jIhQr8jbIFZSomRpeBY2xN
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
