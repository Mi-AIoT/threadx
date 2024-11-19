arm-none-eabi-gcc -c -O2-g -mcpu=cortex-m3 -fpie -fno-plt -mno-pic-data-is-text-relative -msingle-pic-base txm_module_preamble.s
arm-none-eabi-gcc -c -O2-g -mcpu=cortex-m3 -fpie -fno-plt -mno-pic-data-is-text-relative -msingle-pic-base gcc_setup.S
arm-none-eabi-gcc -c -O2-g -mcpu=cortex-m3 -fpie -fno-plt -mno-pic-data-is-text-relative -msingle-pic-base -I..\inc -I..\..\..\..\common\inc -I..\..\..\..\common_modules\inc sample_threadx_module.c
arm-none-eabi-ld -A cortex-m3 -T sample_threadx_module.ld txm_module_preamble.o gcc_setup.o sample_threadx_module.o -e _txm_module_thread_shell_entry txm.a -o sample_threadx_module.axf -M > sample_threadx_module.map 

arm-none-eabi-objcopy.exe --dump-section  .preamble=tmp_preamble.bin  sample_threadx_module.axf
arm-none-eabi-objcopy.exe -j .text -j .got -j .rodata sample_threadx_module.axf -O binary tmp_content.bin
copy /B tmp_preamble.bin + tmp_content.bin sample_threadx_module.bin