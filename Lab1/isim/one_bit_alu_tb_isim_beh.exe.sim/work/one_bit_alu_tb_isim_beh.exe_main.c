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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002362523029_3082161898_init();
    work_m_00000000003200746625_1694758078_init();
    work_m_00000000001475260878_3647534140_init();
    work_m_00000000003673076939_3104681554_init();
    work_m_00000000000481358319_0715238619_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000481358319_0715238619");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
