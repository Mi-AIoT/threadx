echo "Start Qemu with ARM Cortex-M3 CPU and GDB server at localhost port 1234"

echo "Execute in Debugger Console when in debug mode: add-symbol-file ports_module/cortex_m3/gnu/example_build/sample_threadx_module.axf 0x00030000 -s .bss 0x200058d8"
cd /d %~dp0
wsl -e qemu-system-arm -M mps2-an385  -kernel sample_threadx_module_manager.axf -nographic -serial stdio -monitor none -device loader,file=sample_threadx_module.bin,addr=0x00030000 -S -s