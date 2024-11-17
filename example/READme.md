# LinkerScript Understanding

## LedBlink

The above project can also be found in the repository:  
`STM32F446RE/WorkSpace/LedBlink`

This is a simple LED blink project using the **HAL library**.

The **User's Green LED (LD2)** on the board is connected to **PA5**.

### Source Code Explained

The **HAL's toggle pin** function is called inside a `while(1)` loop with a delay.

### Architecture

When the project is cleaned, it contains 4 folders and 4 files:

#### Folders

1. **Includes**  
   This is not an actual folder in the file explorer but is visible in the IDE. It shows the list of preprocessor includes. These files are defined in **Project Settings -> C/C++ Build -> Settings -> Tool Settings -> MCU GCC Compiler -> Include Paths**. Without these includes, the project cannot be built successfully.

2. **Core**  
   This folder contains the `main.c` and `main.h` files. The startup code, written in assembly, is also located in this folder.

3. **Drivers**  
   This folder includes the **HAL** and **CMSIS** drivers, which are provided by the IDE.

4. **Debug**  
   This folder stores object files (`.o`), Makefiles, and outputs like `.hex`, `.bin`, and `.elf` files generated during the build process.

### Clean

1. The output of the **clean** command is shown below for reference.
2. When **clean** is selected, it triggers the `clean` target in the **Makefile**.
3. This command deletes all temporary files such as `.o`, `.cyclo`, `.su`, and `.d`, along with build-generated files like `.hex` and `.elf`.
4. If you're using **Windows CMD**, the clean command may not work as expected since it's based on UNIX commands. To run it successfully, use **Git Bash**.


### Build

1. **"arm-none-eabi-gcc"** is the compiler used for the build process.
2. If you try this in **Windows CMD**, it may not work because the build system is based on UNIX. Use **Git Bash** to run the build successfully.
3. However, the build might fail because the IDE automatically sets up include paths, which are not provided in the manual command.
4. Include paths such as **"arm-none-eabi-gcc"** and others can be found in the **"Includes"** folder in your project.
5. When **build** is selected, it triggers the `build` target in the **Makefile**.
6. First, it processes the `all` target, whose dependency is `main-build`.
7. The `main-build` target depends on `LedBlink.elf` and `secondary-outputs`.
8. **LedBlink.elf**: This is the first output generated, building the file.
9. Once **LedBlink.elf** is built, the following message is echoed:  
   `Finished building target: LedBlink.elf`
10. Then, the size of each section is printed using the ARM `size` utility:

    ```bash
      text	   data	    bss	    dec	    hex	  filename
      10216	     20	   1708	  11944	   2ea8	LedBlink.elf
    ```

11. After that, the process finishes building:
    - `Finished building: default.size.stdout`
    - `Finished building: LedBlink.hex`
    - `Finished building: LedBlink.list`
12. These updates are included in **Balaji.txt**, please have a look.
13. **Secondary-outputs** is the target that prints the size of the file using the `arm-none-eabi-size` utility.




### Output from IDE

1. Clean

'''
07:46:18 **** Clean-only build of configuration Debug for project LedBlink ****
make -j4 clean 
rm -rf ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.su ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.cyclo ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.d ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.o ./Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.su
rm -rf ./Core/Startup/startup_stm32f446retx.d ./Core/Startup/startup_stm32f446retx.o
rm -rf ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32f4xx_hal_msp.cyclo ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_it.cyclo ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.cyclo ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su
rm -rf LedBlink.elf LedBlink.hex LedBlink.list LedBlink.map default.size.stdout
 

07:46:30 Build Finished. 0 errors, 0 warnings. (took 11s.158ms)
'''

1. Build

'''
07:47:45 **** Build of configuration Debug for project LedBlink ****
make -j4 all 
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.o"
arm-none-eabi-gcc "../Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.d" -MT"Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.o"
arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"Core/Startup/startup_stm32f446retx.d" -MT"Core/Startup/startup_stm32f446retx.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Startup/startup_stm32f446retx.o" "../Core/Startup/startup_stm32f446retx.s"
arm-none-eabi-gcc "../Core/Src/main.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/main.d" -MT"Core/Src/main.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/main.o"
arm-none-eabi-gcc "../Core/Src/stm32f4xx_hal_msp.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/stm32f4xx_hal_msp.d" -MT"Core/Src/stm32f4xx_hal_msp.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/stm32f4xx_hal_msp.o"
arm-none-eabi-gcc "../Core/Src/stm32f4xx_it.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/stm32f4xx_it.d" -MT"Core/Src/stm32f4xx_it.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/stm32f4xx_it.o"
In file included from ../Core/Inc/stm32f4xx_hal_conf.h:279,
                 from ../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h:30,
                 from ../Core/Inc/main.h:30,
                 from ../Core/Src/main.c:20:
../Core/Src/main.c: In function 'main':
../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h:91:36: warning: passing argument 2 of 'HAL_GPIO_Init' makes pointer from integer without a cast [-Wint-conversion]
   91 | #define GPIO_PIN_5                 ((uint16_t)0x0020)  /* Pin 5 selected    */
      |                                    ^~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    short unsigned int
../Core/Src/main.c:96:25: note: in expansion of macro 'GPIO_PIN_5'
   96 |   HAL_GPIO_Init( GPIOA, GPIO_PIN_5 );
      |                         ^~~~~~~~~~
In file included from ../Core/Inc/stm32f4xx_hal_conf.h:279,
                 from ../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h:30,
                 from ../Core/Inc/main.h:30,
                 from ../Core/Src/main.c:20:
../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h:225:61: note: expected 'GPIO_InitTypeDef *' but argument is of type 'short unsigned int'
  225 | void  HAL_GPIO_Init(GPIO_TypeDef  *GPIOx, GPIO_InitTypeDef *GPIO_Init);
      |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
arm-none-eabi-gcc "../Core/Src/syscalls.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/syscalls.d" -MT"Core/Src/syscalls.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/syscalls.o"
arm-none-eabi-gcc "../Core/Src/sysmem.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/sysmem.d" -MT"Core/Src/sysmem.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/sysmem.o"
arm-none-eabi-gcc "../Core/Src/system_stm32f4xx.c" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"Core/Src/system_stm32f4xx.d" -MT"Core/Src/system_stm32f4xx.o" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "Core/Src/system_stm32f4xx.o"
arm-none-eabi-gcc -o "LedBlink.elf" @"objects.list"   -mcpu=cortex-m4 -T"E:\GitHub\STM32F446RE\WorkSpace\LedBlink\STM32F446RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="LedBlink.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
Finished building target: LedBlink.elf
 
arm-none-eabi-size   LedBlink.elf 
arm-none-eabi-objdump -h -S  LedBlink.elf  > "LedBlink.list"
arm-none-eabi-objcopy  -O ihex  LedBlink.elf  "LedBlink.hex"
   text	   data	    bss	    dec	    hex	filename
  10216	     20	   1708	  11944	   2ea8	LedBlink.elf
Finished building: default.size.stdout
 
Finished building: LedBlink.hex
 
Finished building: LedBlink.list
 

07:48:26 Build Finished. 0 errors, 1 warnings. (took 40s.928ms)


'''

1. Debug

'''


STMicroelectronics ST-LINK GDB server. Version 7.3.0
Copyright (c) 2023, STMicroelectronics. All rights reserved.

Starting server with the following options:
        Persistent Mode            : Disabled
        Logging Level              : 1
        Listen Port Number         : 61234
        Status Refresh Delay       : 15s
        Verbose Mode               : Disabled
        SWD Debug                  : Enabled
        InitWhile                  : Enabled

Waiting for debugger connection...
Debugger connected
Waiting for debugger connection...
Debugger connected
Waiting for debugger connection...
      -------------------------------------------------------------------
                       STM32CubeProgrammer v2.13.0                  
      -------------------------------------------------------------------



Log output file:   C:\Users\Balaji\AppData\Local\Temp\STM32CubeProgrammer_a10932.log
ST-LINK SN  : 066AFF3530384E5043152716
ST-LINK FW  : V2J41M27
Board       : NUCLEO-F446RE
Voltage     : 3.27V
SWD freq    : 4000 KHz
Connect mode: Under Reset
Reset mode  : Hardware reset
Device ID   : 0x421
Revision ID : Rev A
Device name : STM32F446xx
Flash size  : 512 KBytes
Device type : MCU
Device CPU  : Cortex-M4
BL Version  : 0x90



Memory Programming ...
Opening and parsing file: ST-LINK_GDB_server_a10932.srec
  File          : ST-LINK_GDB_server_a10932.srec
  Size          : 10.00 KB 
  Address       : 0x08000000 


Erasing memory corresponding to segment 0:
Erasing internal memory sector 0
Download in Progress:


File download complete
Time elapsed during download operation: 00:00:00.438



Verifying ...




Download verified successfully 


Shutting down...
Exit.

'''
