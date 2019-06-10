echo "Building!"

SERIES=STM32L4xx
GENERAL_DEVICE=stm32l4xx
DEVICE_EDITION=stm32l476xx

TOOLCHAIN_PATH=~/build/gcc-arm-none-eabi-8-2018-q4-major/bin
STM32_CUBE_PATH=~/build/STM32Cube_FW_L4_V1.14.0

SERIES_FOLDER=$STM32_CUBE_PATH/Drivers/CMSIS/Device/ST/$SERIES

HEADERS=$SERIES_FOLDER/Include

ARM_HEADERS=-I$STM32_CUBE_PATH/Drivers/CMSIS/Core/Include

CC=$TOOLCHAIN_PATH/arm-none-eabi-gcc
SIZE=$TOOLCHAIN_PATH/arm-none-eabi-size
OBJCOPY=$TOOLCHAIN_PATH/arm-none-eabi-objcopy

COMP_FLAGS="-Wall -g"
ARM_FLAGS="-mthumb"

DEVICE_FLAGS="-Tvendor/stm32l476xx/STM32L476RG.ld -mcpu=cortex-m4"

SRC="src/main.c vendor/stm32l476xx/src/*"

OUT="build/main.elf"

rm $OUT

$CC $COMP_FLAGS $GCC_FLAGS $ARM_FLAGS $DEVICE_FLAGS -DSTM32L476xx $ARM_HEADERS -I$HEADERS $SRC -o $OUT -specs=nosys.specs

$SIZE -tA $OUT
