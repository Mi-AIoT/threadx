arm-none-eabi-gcc -c -O2 -g -mcpu=cortex-m3 -mthumb -I..\inc -I..\..\..\..\common\inc -I..\..\..\..\common_modules\inc sample_threadx_module_manager.c
arm-none-eabi-gcc -c -O2 -g -mcpu=cortex-m3 -mthumb tx_simulator_startup.S
arm-none-eabi-gcc -c -O2 -g -mcpu=cortex-m3 -mthumb cortexm_crt0.S
arm-none-eabi-gcc -g -O2 -mcpu=cortex-m3 -mthumb -T sample_threadx.ld -ereset_handler -nostartfiles  tx_simulator_startup.o cortexm_crt0.o sample_threadx_module_manager.o tx.a  -lc -o sample_threadx_module_manager.axf  -Wl,-Map=sample_threadx_module_manager.map
