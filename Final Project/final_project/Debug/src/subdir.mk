################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cam_ctrl.c \
../src/helloworld.c \
../src/main.c \
../src/platform.c \
../src/vmodcam_cfg.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/cam_ctrl.o \
./src/helloworld.o \
./src/main.o \
./src/platform.o \
./src/vmodcam_cfg.o 

C_DEPS += \
./src/cam_ctrl.d \
./src/helloworld.d \
./src/main.d \
./src/platform.d \
./src/vmodcam_cfg.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -Os -g3 -c -fmessage-length=0 -MT"$@" -I../../final_project_bsp/microblaze_0/include -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.b -mno-xl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


