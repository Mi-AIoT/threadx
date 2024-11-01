arm-none-eabi-gcc -c -g -mcpu=cortex-m3 -mthumb -I..\inc -I..\..\..\..\common\inc sample_threadx.c
arm-none-eabi-gcc -c -g -mcpu=cortex-m3 -mthumb tx_simulator_startup.S
arm-none-eabi-gcc -c -g -mcpu=cortex-m3 -mthumb cortexm_crt0.S
arm-none-eabi-gcc -g -mcpu=cortex-m3 -mthumb -T sample_threadx.ld -ereset_handler -nostartfiles -o sample_threadx.out -Wl,-Map=sample_threadx.map  tx_simulator_startup.o cortexm_crt0.o sample_threadx.o tx.a -lc -o sample_threadx.axf
