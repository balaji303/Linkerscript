# Variables for utilities
GCC       = arm-none-eabi-gcc
LD        = arm-none-eabi-ld
READELF   = arm-none-eabi-readelf

# Target can be anything
TARGET = main
ADDITIONAL_FILE = side
# TARGET = balaji

# variable for linker scrtip, map file and the readelf output
LD_SCRIPT   = $(TARGET).ld
LD_MAP      = $(TARGET).map
READELF_OUT = $(TARGET).txt

# object files our exploration depends on
OBJ = $(TARGET).o $(ADDITIONAL_FILE).o

# this is executed on running `make`
all: $(READELF_OUT)
	@

# generates the log
$(READELF_OUT): $(TARGET).elf
	$(READELF) -a $^ > $@

# output file 
$(TARGET).elf: $(OBJ) $(LD_SCRIPT)
	$(LD) -T$(LD_SCRIPT) -Map=$(LD_MAP) -o $@ $(OBJ)

%.o: %.c
	$(GCC) -Wall -nostdlib -fno-builtin -ffreestanding -c $<

clean:
	rm -f *.o *.elf *.txt *.map *.log
