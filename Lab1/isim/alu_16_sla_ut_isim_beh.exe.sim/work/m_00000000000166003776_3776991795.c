/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/CS152B/Desktop/RMJ/RMJ-Lab1/16_bit_alu_sim/alu_16_sla_ut.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {4095U, 0U};
static int ng3[] = {4, 0};
static int ng4[] = {5, 0};
static int ng5[] = {21, 0};
static int ng6[] = {16, 0};
static int ng7[] = {0, 0};
static int ng8[] = {12, 0};
static int ng9[] = {32767, 0};
static int ng10[] = {32768, 0};
static unsigned int ng11[] = {40960U, 0U};
static int ng12[] = {7, 0};



static int sp_testcase(char *t1, char *t2)
{
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 848);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(58, ng0);

LAB5:    xsi_set_current_line(59, ng0);
    t5 = (t1 + 3112);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t1 + 2632);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 16);
    xsi_set_current_line(60, ng0);
    t4 = (t1 + 3272);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t1 + 2792);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 16);
    xsi_set_current_line(65, ng0);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    xsi_process_wait(t5, 5000LL);
    *((char **)t3) = &&LAB6;
    t0 = 1;

LAB1:    return t0;
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;
    goto LAB1;

LAB6:    goto LAB4;

}

static int sp_run_tests(char *t1, char *t2)
{
    char t30[8];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1280);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(74, ng0);

LAB5:    xsi_set_current_line(78, ng0);
    t5 = ((char*)((ng1)));
    t6 = ((char*)((ng1)));
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t10, &&LAB6);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t1 + 848);
    t14 = xsi_create_subprogram_invocation(t12, 0, t1, t13, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t13, t14);
    t15 = (t1 + 3112);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);
    t16 = (t1 + 3272);
    xsi_vlogvar_assign_value(t16, t6, 0, 0, 16);

LAB8:    t17 = (t2 + 64U);
    t18 = *((char **)t17);
    t19 = (t18 + 80U);
    t20 = *((char **)t19);
    t21 = (t20 + 272U);
    t22 = *((char **)t21);
    t23 = (t22 + 0U);
    t24 = *((char **)t23);
    t25 = ((int  (*)(char *, char *))t24)(t1, t18);
    if (t25 == -1)
        goto LAB9;

LAB10:    if (t25 != 0)
        goto LAB11;

LAB6:    t18 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t18);

LAB7:    t26 = (t2 + 64U);
    t27 = *((char **)t26);
    t26 = (t1 + 848);
    t28 = (t2 + 56U);
    t29 = *((char **)t28);
    xsi_delete_subprogram_invocation(t26, t27, t1, t29, t2);
    xsi_set_current_line(79, ng0);
    t4 = ((char*)((ng2)));
    t5 = ((char*)((ng3)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB12);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB14:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB15;

LAB16:    if (t25 != 0)
        goto LAB17;

LAB12:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB13:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(80, ng0);
    t4 = ((char*)((ng4)));
    memset(t30, 0, 8);
    xsi_vlog_signed_unary_minus(t30, 32, t4, 32);
    t5 = ((char*)((ng4)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB18);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t30, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB20:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB21;

LAB22:    if (t25 != 0)
        goto LAB23;

LAB18:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB19:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(81, ng0);
    t4 = ((char*)((ng5)));
    t5 = ((char*)((ng6)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB24);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB26:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB27;

LAB28:    if (t25 != 0)
        goto LAB29;

LAB24:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB25:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(82, ng0);
    t4 = ((char*)((ng7)));
    t5 = ((char*)((ng8)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB30);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB32:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB33;

LAB34:    if (t25 != 0)
        goto LAB35;

LAB30:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB31:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(83, ng0);
    t4 = ((char*)((ng9)));
    t5 = ((char*)((ng1)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB36);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB38:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB39;

LAB40:    if (t25 != 0)
        goto LAB41;

LAB36:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB37:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(88, ng0);
    t4 = ((char*)((ng1)));
    t5 = ((char*)((ng7)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB42);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB44:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB45;

LAB46:    if (t25 != 0)
        goto LAB47;

LAB42:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB43:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(89, ng0);
    t4 = ((char*)((ng10)));
    memset(t30, 0, 8);
    xsi_vlog_signed_unary_minus(t30, 32, t4, 32);
    t5 = ((char*)((ng7)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB48);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t30, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB50:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB51;

LAB52:    if (t25 != 0)
        goto LAB53;

LAB48:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB49:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(90, ng0);
    t4 = ((char*)((ng7)));
    t5 = ((char*)((ng7)));
    memset(t30, 0, 8);
    xsi_vlog_signed_unary_minus(t30, 32, t5, 32);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB54);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t30, 0, 0, 16);

LAB56:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB57;

LAB58:    if (t25 != 0)
        goto LAB59;

LAB54:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB55:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);
    xsi_set_current_line(96, ng0);
    t4 = ((char*)((ng11)));
    t5 = ((char*)((ng1)));
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_subprograminvocation_setJumpstate(t2, t9, &&LAB60);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t1 + 848);
    t13 = xsi_create_subprogram_invocation(t11, 0, t1, t12, 0, t2);
    xsi_vlog_subprogram_pushinvocation(t12, t13);
    t14 = (t1 + 3112);
    xsi_vlogvar_assign_value(t14, t4, 0, 0, 16);
    t15 = (t1 + 3272);
    xsi_vlogvar_assign_value(t15, t5, 0, 0, 16);

LAB62:    t16 = (t2 + 64U);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t25 = ((int  (*)(char *, char *))t23)(t1, t17);
    if (t25 == -1)
        goto LAB63;

LAB64:    if (t25 != 0)
        goto LAB65;

LAB60:    t17 = (t1 + 848);
    xsi_vlog_subprogram_popinvocation(t17);

LAB61:    t24 = (t2 + 64U);
    t26 = *((char **)t24);
    t24 = (t1 + 848);
    t27 = (t2 + 56U);
    t28 = *((char **)t27);
    xsi_delete_subprogram_invocation(t24, t26, t1, t28, t2);

LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB9:    t0 = -1;
    goto LAB1;

LAB11:    t17 = (t2 + 48U);
    *((char **)t17) = &&LAB8;
    goto LAB1;

LAB15:    t0 = -1;
    goto LAB1;

LAB17:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB14;
    goto LAB1;

LAB21:    t0 = -1;
    goto LAB1;

LAB23:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB20;
    goto LAB1;

LAB27:    t0 = -1;
    goto LAB1;

LAB29:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB26;
    goto LAB1;

LAB33:    t0 = -1;
    goto LAB1;

LAB35:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB32;
    goto LAB1;

LAB39:    t0 = -1;
    goto LAB1;

LAB41:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB38;
    goto LAB1;

LAB45:    t0 = -1;
    goto LAB1;

LAB47:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB44;
    goto LAB1;

LAB51:    t0 = -1;
    goto LAB1;

LAB53:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB50;
    goto LAB1;

LAB57:    t0 = -1;
    goto LAB1;

LAB59:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB56;
    goto LAB1;

LAB63:    t0 = -1;
    goto LAB1;

LAB65:    t16 = (t2 + 48U);
    *((char **)t16) = &&LAB62;
    goto LAB1;

}

static void Initial_103_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(103, ng0);

LAB4:    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2632);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2792);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 2952);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 4000);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(120, ng0);
    t3 = (t0 + 4000);
    t4 = (t0 + 1280);
    t5 = xsi_create_subprogram_invocation(t3, 0, t0, t4, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t4, t5);

LAB8:    t6 = (t0 + 4096);
    t7 = *((char **)t6);
    t8 = (t7 + 80U);
    t9 = *((char **)t8);
    t10 = (t9 + 272U);
    t11 = *((char **)t10);
    t12 = (t11 + 0U);
    t13 = *((char **)t12);
    t14 = ((int  (*)(char *, char *))t13)(t0, t7);

LAB10:    if (t14 != 0)
        goto LAB11;

LAB6:    t7 = (t0 + 1280);
    xsi_vlog_subprogram_popinvocation(t7);

LAB7:    t15 = (t0 + 4096);
    t16 = *((char **)t15);
    t15 = (t0 + 1280);
    t17 = (t0 + 4000);
    t18 = 0;
    xsi_delete_subprogram_invocation(t15, t16, t0, t17, t18);
    xsi_set_current_line(125, ng0);
    xsi_vlog_finish(1);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4000);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB9:;
LAB11:    t6 = (t0 + 4192U);
    *((char **)t6) = &&LAB8;
    goto LAB1;

LAB12:    goto LAB1;

}


extern void work_m_00000000000166003776_3776991795_init()
{
	static char *pe[] = {(void *)Initial_103_0};
	static char *se[] = {(void *)sp_testcase,(void *)sp_run_tests};
	xsi_register_didat("work_m_00000000000166003776_3776991795", "isim/alu_16_sla_ut_isim_beh.exe.sim/work/m_00000000000166003776_3776991795.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
