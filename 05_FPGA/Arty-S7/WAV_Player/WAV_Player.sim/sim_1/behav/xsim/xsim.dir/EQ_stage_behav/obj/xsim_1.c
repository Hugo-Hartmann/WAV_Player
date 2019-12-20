/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_2(char*, char *);
extern void execute_3(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_51(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_236(char*, char *);
extern void execute_802(char*, char *);
extern void execute_803(char*, char *);
extern void execute_897(char*, char *);
extern void execute_53(char*, char *);
extern void execute_66(char*, char *);
extern void execute_228(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_921(char*, char *);
extern void execute_922(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_901(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_905(char*, char *);
extern void execute_907(char*, char *);
extern void execute_908(char*, char *);
extern void execute_909(char*, char *);
extern void execute_910(char*, char *);
extern void execute_911(char*, char *);
extern void execute_912(char*, char *);
extern void execute_913(char*, char *);
extern void execute_914(char*, char *);
extern void execute_915(char*, char *);
extern void execute_916(char*, char *);
extern void execute_917(char*, char *);
extern void execute_918(char*, char *);
extern void execute_919(char*, char *);
extern void execute_920(char*, char *);
extern void execute_147(char*, char *);
extern void execute_150(char*, char *);
extern void execute_226(char*, char *);
extern void execute_227(char*, char *);
extern void execute_225(char*, char *);
extern void execute_219(char*, char *);
extern void execute_212(char*, char *);
extern void execute_213(char*, char *);
extern void execute_187(char*, char *);
extern void execute_190(char*, char *);
extern void execute_193(char*, char *);
extern void execute_210(char*, char *);
extern void execute_217(char*, char *);
extern void execute_208(char*, char *);
extern void execute_199(char*, char *);
extern void execute_202(char*, char *);
extern void execute_204(char*, char *);
extern void execute_183(char*, char *);
extern void execute_184(char*, char *);
extern void execute_179(char*, char *);
extern void execute_181(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_42(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_32(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_85(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_89(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_93(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_223(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_227(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_231(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_232(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_333(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_337(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_341(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_342(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_443(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_447(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_451(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_452(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_553(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_557(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_561(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_562(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_663(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_667(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_671(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_672(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_773(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_777(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_781(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_782(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_886(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_890(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_894(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_895(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[118] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_51, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_802, (funcp)execute_803, (funcp)execute_897, (funcp)execute_53, (funcp)execute_66, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_921, (funcp)execute_922, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_57, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_901, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_905, (funcp)execute_907, (funcp)execute_908, (funcp)execute_909, (funcp)execute_910, (funcp)execute_911, (funcp)execute_912, (funcp)execute_913, (funcp)execute_914, (funcp)execute_915, (funcp)execute_916, (funcp)execute_917, (funcp)execute_918, (funcp)execute_919, (funcp)execute_920, (funcp)execute_147, (funcp)execute_150, (funcp)execute_226, (funcp)execute_227, (funcp)execute_225, (funcp)execute_219, (funcp)execute_212, (funcp)execute_213, (funcp)execute_187, (funcp)execute_190, (funcp)execute_193, (funcp)execute_210, (funcp)execute_217, (funcp)execute_208, (funcp)execute_199, (funcp)execute_202, (funcp)execute_204, (funcp)execute_183, (funcp)execute_184, (funcp)execute_179, (funcp)execute_181, (funcp)execute_40, (funcp)execute_41, (funcp)execute_42, (funcp)execute_43, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_48, (funcp)execute_49, (funcp)execute_50, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_32, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_85, (funcp)transaction_89, (funcp)transaction_93, (funcp)transaction_94, (funcp)transaction_223, (funcp)transaction_227, (funcp)transaction_231, (funcp)transaction_232, (funcp)transaction_333, (funcp)transaction_337, (funcp)transaction_341, (funcp)transaction_342, (funcp)transaction_443, (funcp)transaction_447, (funcp)transaction_451, (funcp)transaction_452, (funcp)transaction_553, (funcp)transaction_557, (funcp)transaction_561, (funcp)transaction_562, (funcp)transaction_663, (funcp)transaction_667, (funcp)transaction_671, (funcp)transaction_672, (funcp)transaction_773, (funcp)transaction_777, (funcp)transaction_781, (funcp)transaction_782, (funcp)transaction_886, (funcp)transaction_890, (funcp)transaction_894, (funcp)transaction_895};
const int NumRelocateId= 118;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/EQ_stage_behav/xsim.reloc",  (void **)funcTab, 118);
	iki_vhdl_file_variable_register(dp + 208136);
	iki_vhdl_file_variable_register(dp + 208192);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/EQ_stage_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 405440, dp + 407200, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 220768, dp + 222528, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 250920, dp + 252680, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 281072, dp + 282832, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 311224, dp + 312984, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 341376, dp + 343136, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 371528, dp + 373288, 0, 4, 0, 4, 5, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 435592, dp + 437352, 0, 4, 0, 4, 5, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/EQ_stage_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/EQ_stage_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/EQ_stage_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/EQ_stage_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
