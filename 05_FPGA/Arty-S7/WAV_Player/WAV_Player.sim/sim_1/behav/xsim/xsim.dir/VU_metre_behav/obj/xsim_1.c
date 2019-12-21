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
extern void execute_2186(char*, char *);
extern void execute_2187(char*, char *);
extern void execute_2188(char*, char *);
extern void execute_2189(char*, char *);
extern void execute_2190(char*, char *);
extern void execute_2191(char*, char *);
extern void execute_2192(char*, char *);
extern void execute_2193(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_373(char*, char *);
extern void execute_374(char*, char *);
extern void execute_375(char*, char *);
extern void execute_376(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_2326(char*, char *);
extern void execute_2327(char*, char *);
extern void execute_2336(char*, char *);
extern void execute_2337(char*, char *);
extern void execute_2338(char*, char *);
extern void execute_2339(char*, char *);
extern void execute_2340(char*, char *);
extern void execute_2342(char*, char *);
extern void execute_2347(char*, char *);
extern void execute_2348(char*, char *);
extern void execute_2349(char*, char *);
extern void execute_2350(char*, char *);
extern void execute_2351(char*, char *);
extern void execute_52(char*, char *);
extern void execute_80(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_2231(char*, char *);
extern void execute_2312(char*, char *);
extern void execute_2313(char*, char *);
extern void execute_2314(char*, char *);
extern void execute_2315(char*, char *);
extern void execute_2316(char*, char *);
extern void execute_2317(char*, char *);
extern void execute_2318(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_79(char*, char *);
extern void execute_2244(char*, char *);
extern void execute_2245(char*, char *);
extern void execute_2246(char*, char *);
extern void execute_2247(char*, char *);
extern void execute_2248(char*, char *);
extern void execute_2249(char*, char *);
extern void execute_2250(char*, char *);
extern void execute_2252(char*, char *);
extern void execute_2253(char*, char *);
extern void execute_2254(char*, char *);
extern void execute_2255(char*, char *);
extern void execute_2259(char*, char *);
extern void execute_2263(char*, char *);
extern void execute_2264(char*, char *);
extern void execute_2265(char*, char *);
extern void execute_2266(char*, char *);
extern void execute_2267(char*, char *);
extern void execute_2268(char*, char *);
extern void execute_2271(char*, char *);
extern void execute_2273(char*, char *);
extern void execute_2274(char*, char *);
extern void execute_2275(char*, char *);
extern void execute_2276(char*, char *);
extern void execute_2277(char*, char *);
extern void execute_2278(char*, char *);
extern void execute_2279(char*, char *);
extern void execute_2280(char*, char *);
extern void execute_2281(char*, char *);
extern void execute_2282(char*, char *);
extern void execute_2283(char*, char *);
extern void execute_2284(char*, char *);
extern void execute_2285(char*, char *);
extern void execute_2286(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_2256(char*, char *);
extern void execute_2257(char*, char *);
extern void execute_2258(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_2260(char*, char *);
extern void execute_2261(char*, char *);
extern void execute_2262(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_145(char*, char *);
extern void execute_150(char*, char *);
extern void execute_152(char*, char *);
extern void execute_155(char*, char *);
extern void execute_160(char*, char *);
extern void execute_167(char*, char *);
extern void execute_168(char*, char *);
extern void execute_165(char*, char *);
extern void execute_171(char*, char *);
extern void execute_370(char*, char *);
extern void execute_176(char*, char *);
extern void execute_190(char*, char *);
extern void execute_186(char*, char *);
extern void execute_188(char*, char *);
extern void execute_192(char*, char *);
extern void execute_367(char*, char *);
extern void execute_203(char*, char *);
extern void execute_204(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_210(char*, char *);
extern void execute_213(char*, char *);
extern void execute_215(char*, char *);
extern void execute_216(char*, char *);
extern void execute_218(char*, char *);
extern void execute_219(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_249(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_253(char*, char *);
extern void execute_254(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_261(char*, char *);
extern void execute_262(char*, char *);
extern void execute_263(char*, char *);
extern void execute_264(char*, char *);
extern void execute_265(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_273(char*, char *);
extern void execute_274(char*, char *);
extern void execute_275(char*, char *);
extern void execute_276(char*, char *);
extern void execute_277(char*, char *);
extern void execute_278(char*, char *);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_282(char*, char *);
extern void execute_283(char*, char *);
extern void execute_284(char*, char *);
extern void execute_285(char*, char *);
extern void execute_286(char*, char *);
extern void execute_287(char*, char *);
extern void execute_288(char*, char *);
extern void execute_289(char*, char *);
extern void execute_290(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void execute_293(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_296(char*, char *);
extern void execute_297(char*, char *);
extern void execute_298(char*, char *);
extern void execute_299(char*, char *);
extern void execute_300(char*, char *);
extern void execute_301(char*, char *);
extern void execute_302(char*, char *);
extern void execute_303(char*, char *);
extern void execute_304(char*, char *);
extern void execute_305(char*, char *);
extern void execute_306(char*, char *);
extern void execute_307(char*, char *);
extern void execute_308(char*, char *);
extern void execute_309(char*, char *);
extern void execute_310(char*, char *);
extern void execute_311(char*, char *);
extern void execute_312(char*, char *);
extern void execute_313(char*, char *);
extern void execute_314(char*, char *);
extern void execute_315(char*, char *);
extern void execute_316(char*, char *);
extern void execute_317(char*, char *);
extern void execute_318(char*, char *);
extern void execute_319(char*, char *);
extern void execute_320(char*, char *);
extern void execute_321(char*, char *);
extern void execute_322(char*, char *);
extern void execute_323(char*, char *);
extern void execute_324(char*, char *);
extern void execute_325(char*, char *);
extern void execute_326(char*, char *);
extern void execute_327(char*, char *);
extern void execute_328(char*, char *);
extern void execute_329(char*, char *);
extern void execute_330(char*, char *);
extern void execute_331(char*, char *);
extern void execute_332(char*, char *);
extern void execute_333(char*, char *);
extern void execute_334(char*, char *);
extern void execute_335(char*, char *);
extern void execute_336(char*, char *);
extern void execute_337(char*, char *);
extern void execute_338(char*, char *);
extern void execute_339(char*, char *);
extern void execute_340(char*, char *);
extern void execute_341(char*, char *);
extern void execute_342(char*, char *);
extern void execute_343(char*, char *);
extern void execute_344(char*, char *);
extern void execute_345(char*, char *);
extern void execute_346(char*, char *);
extern void execute_347(char*, char *);
extern void execute_348(char*, char *);
extern void execute_349(char*, char *);
extern void execute_350(char*, char *);
extern void execute_351(char*, char *);
extern void execute_352(char*, char *);
extern void execute_353(char*, char *);
extern void execute_354(char*, char *);
extern void execute_355(char*, char *);
extern void execute_356(char*, char *);
extern void execute_357(char*, char *);
extern void execute_358(char*, char *);
extern void execute_359(char*, char *);
extern void execute_360(char*, char *);
extern void execute_361(char*, char *);
extern void execute_362(char*, char *);
extern void execute_363(char*, char *);
extern void execute_364(char*, char *);
extern void execute_365(char*, char *);
extern void execute_366(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_32(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_575(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_713(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_714(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_715(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_716(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_724(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_726(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_727(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_728(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_729(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_730(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_731(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1209(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1347(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1348(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1349(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1350(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1358(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1360(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1361(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1362(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1363(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1364(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1365(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1843(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1981(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1982(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1983(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1984(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1992(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1994(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1995(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1996(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1997(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1998(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1999(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2477(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2615(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2616(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2617(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2618(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2626(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2628(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2629(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2630(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2631(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2632(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2633(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3111(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3249(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3250(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3251(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3252(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3260(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3262(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3263(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3264(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3265(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3266(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3267(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3745(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3883(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3884(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3885(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3886(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3894(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3896(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3897(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3898(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3899(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3900(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3901(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4379(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4517(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4518(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4519(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4520(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4528(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4530(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4531(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4532(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4533(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4534(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4535(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5013(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[360] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_2186, (funcp)execute_2187, (funcp)execute_2188, (funcp)execute_2189, (funcp)execute_2190, (funcp)execute_2191, (funcp)execute_2192, (funcp)execute_2193, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_373, (funcp)execute_374, (funcp)execute_375, (funcp)execute_376, (funcp)execute_377, (funcp)execute_378, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2326, (funcp)execute_2327, (funcp)execute_2336, (funcp)execute_2337, (funcp)execute_2338, (funcp)execute_2339, (funcp)execute_2340, (funcp)execute_2342, (funcp)execute_2347, (funcp)execute_2348, (funcp)execute_2349, (funcp)execute_2350, (funcp)execute_2351, (funcp)execute_52, (funcp)execute_80, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2231, (funcp)execute_2312, (funcp)execute_2313, (funcp)execute_2314, (funcp)execute_2315, (funcp)execute_2316, (funcp)execute_2317, (funcp)execute_2318, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_2244, (funcp)execute_2245, (funcp)execute_2246, (funcp)execute_2247, (funcp)execute_2248, (funcp)execute_2249, (funcp)execute_2250, (funcp)execute_2252, (funcp)execute_2253, (funcp)execute_2254, (funcp)execute_2255, (funcp)execute_2259, (funcp)execute_2263, (funcp)execute_2264, (funcp)execute_2265, (funcp)execute_2266, (funcp)execute_2267, (funcp)execute_2268, (funcp)execute_2271, (funcp)execute_2273, (funcp)execute_2274, (funcp)execute_2275, (funcp)execute_2276, (funcp)execute_2277, (funcp)execute_2278, (funcp)execute_2279, (funcp)execute_2280, (funcp)execute_2281, (funcp)execute_2282, (funcp)execute_2283, (funcp)execute_2284, (funcp)execute_2285, (funcp)execute_2286, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_2256, (funcp)execute_2257, (funcp)execute_2258, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_2260, (funcp)execute_2261, (funcp)execute_2262, (funcp)execute_75, (funcp)execute_76, (funcp)execute_145, (funcp)execute_150, (funcp)execute_152, (funcp)execute_155, (funcp)execute_160, (funcp)execute_167, (funcp)execute_168, (funcp)execute_165, (funcp)execute_171, (funcp)execute_370, (funcp)execute_176, (funcp)execute_190, (funcp)execute_186, (funcp)execute_188, (funcp)execute_192, (funcp)execute_367, (funcp)execute_203, (funcp)execute_204, (funcp)execute_207, (funcp)execute_208, (funcp)execute_210, (funcp)execute_213, (funcp)execute_215, (funcp)execute_216, (funcp)execute_218, (funcp)execute_219, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)execute_250, (funcp)execute_251, (funcp)execute_252, (funcp)execute_253, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_263, (funcp)execute_264, (funcp)execute_265, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_273, (funcp)execute_274, (funcp)execute_275, (funcp)execute_276, (funcp)execute_277, (funcp)execute_278, (funcp)execute_279, (funcp)execute_280, (funcp)execute_281, (funcp)execute_282, (funcp)execute_283, (funcp)execute_284, (funcp)execute_285, (funcp)execute_286, (funcp)execute_287, (funcp)execute_288, (funcp)execute_289, (funcp)execute_290, (funcp)execute_291, (funcp)execute_292, (funcp)execute_293, (funcp)execute_294, (funcp)execute_295, (funcp)execute_296, (funcp)execute_297, (funcp)execute_298, (funcp)execute_299, (funcp)execute_300, (funcp)execute_301, (funcp)execute_302, (funcp)execute_303, (funcp)execute_304, (funcp)execute_305, (funcp)execute_306, (funcp)execute_307, (funcp)execute_308, (funcp)execute_309, (funcp)execute_310, (funcp)execute_311, (funcp)execute_312, (funcp)execute_313, (funcp)execute_314, (funcp)execute_315, (funcp)execute_316, (funcp)execute_317, (funcp)execute_318, (funcp)execute_319, (funcp)execute_320, (funcp)execute_321, (funcp)execute_322, (funcp)execute_323, (funcp)execute_324, (funcp)execute_325, (funcp)execute_326, (funcp)execute_327, (funcp)execute_328, (funcp)execute_329, (funcp)execute_330, (funcp)execute_331, (funcp)execute_332, (funcp)execute_333, (funcp)execute_334, (funcp)execute_335, (funcp)execute_336, (funcp)execute_337, (funcp)execute_338, (funcp)execute_339, (funcp)execute_340, (funcp)execute_341, (funcp)execute_342, (funcp)execute_343, (funcp)execute_344, (funcp)execute_345, (funcp)execute_346, (funcp)execute_347, (funcp)execute_348, (funcp)execute_349, (funcp)execute_350, (funcp)execute_351, (funcp)execute_352, (funcp)execute_353, (funcp)execute_354, (funcp)execute_355, (funcp)execute_356, (funcp)execute_357, (funcp)execute_358, (funcp)execute_359, (funcp)execute_360, (funcp)execute_361, (funcp)execute_362, (funcp)execute_363, (funcp)execute_364, (funcp)execute_365, (funcp)execute_366, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_32, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_62, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_575, (funcp)transaction_713, (funcp)transaction_714, (funcp)transaction_715, (funcp)transaction_716, (funcp)transaction_724, (funcp)transaction_726, (funcp)transaction_727, (funcp)transaction_728, (funcp)transaction_729, (funcp)transaction_730, (funcp)transaction_731, (funcp)transaction_1209, (funcp)transaction_1347, (funcp)transaction_1348, (funcp)transaction_1349, (funcp)transaction_1350, (funcp)transaction_1358, (funcp)transaction_1360, (funcp)transaction_1361, (funcp)transaction_1362, (funcp)transaction_1363, (funcp)transaction_1364, (funcp)transaction_1365, (funcp)transaction_1843, (funcp)transaction_1981, (funcp)transaction_1982, (funcp)transaction_1983, (funcp)transaction_1984, (funcp)transaction_1992, (funcp)transaction_1994, (funcp)transaction_1995, (funcp)transaction_1996, (funcp)transaction_1997, (funcp)transaction_1998, (funcp)transaction_1999, (funcp)transaction_2477, (funcp)transaction_2615, (funcp)transaction_2616, (funcp)transaction_2617, (funcp)transaction_2618, (funcp)transaction_2626, (funcp)transaction_2628, (funcp)transaction_2629, (funcp)transaction_2630, (funcp)transaction_2631, (funcp)transaction_2632, (funcp)transaction_2633, (funcp)transaction_3111, (funcp)transaction_3249, (funcp)transaction_3250, (funcp)transaction_3251, (funcp)transaction_3252, (funcp)transaction_3260, (funcp)transaction_3262, (funcp)transaction_3263, (funcp)transaction_3264, (funcp)transaction_3265, (funcp)transaction_3266, (funcp)transaction_3267, (funcp)transaction_3745, (funcp)transaction_3883, (funcp)transaction_3884, (funcp)transaction_3885, (funcp)transaction_3886, (funcp)transaction_3894, (funcp)transaction_3896, (funcp)transaction_3897, (funcp)transaction_3898, (funcp)transaction_3899, (funcp)transaction_3900, (funcp)transaction_3901, (funcp)transaction_4379, (funcp)transaction_4517, (funcp)transaction_4518, (funcp)transaction_4519, (funcp)transaction_4520, (funcp)transaction_4528, (funcp)transaction_4530, (funcp)transaction_4531, (funcp)transaction_4532, (funcp)transaction_4533, (funcp)transaction_4534, (funcp)transaction_4535, (funcp)transaction_5013};
const int NumRelocateId= 360;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/VU_metre_behav/xsim.reloc",  (void **)funcTab, 360);
	iki_vhdl_file_variable_register(dp + 1171040);
	iki_vhdl_file_variable_register(dp + 1171096);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/VU_metre_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1192784, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1190472, dp + 1192952, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1190432, dp + 1192896, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1190792, dp + 1192840, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1190352, dp + 1193008, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1318488, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1316176, dp + 1318656, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1316136, dp + 1318600, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1316496, dp + 1318544, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1316056, dp + 1318712, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1444192, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1441880, dp + 1444360, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1441840, dp + 1444304, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1442200, dp + 1444248, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1441760, dp + 1444416, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1569896, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1567584, dp + 1570064, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1567544, dp + 1570008, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1567904, dp + 1569952, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1567464, dp + 1570120, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1695600, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1693288, dp + 1695768, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1693248, dp + 1695712, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1693608, dp + 1695656, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1693168, dp + 1695824, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1821304, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1818992, dp + 1821472, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1818952, dp + 1821416, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1819312, dp + 1821360, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1818872, dp + 1821528, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 1947008, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1944696, dp + 1947176, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1944656, dp + 1947120, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1945016, dp + 1947064, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1944576, dp + 1947232, 0, 15, 0, 15, 16, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1186872, dp + 2072712, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2070400, dp + 2072880, 0, 10, 0, 10, 11, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2070360, dp + 2072824, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2070720, dp + 2072768, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2070280, dp + 2072936, 0, 15, 0, 15, 16, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/VU_metre_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/VU_metre_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/VU_metre_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/VU_metre_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
