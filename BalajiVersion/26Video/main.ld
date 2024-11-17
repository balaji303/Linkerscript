/*

After adding .rodata section in linker
 Const data types are considered from now
They can also be seen on the map file

*/
MEMORY
{
    /* Instead of SOME_NAME, RAM is used*/
    RAM : ORIGIN = 0xA000, LENGTH = 0x1000
    ROM : ORIGIN = 0xB000, LENGTH = 0x1000
}

SECTIONS
{
    .text : {
        *(.text)
    } > ROM AT > ROM

    /* Const data types are considered from now */
    .rodata : {
        *(.rodata)
        /* This variable is used to get the end of .rodata section
           which is also the start of data section in ROM */
        __variable_rodata_end = .;
    } > ROM AT > ROM

    .data : {
        /* This variable is used to get the start of .data section in RAM */
        __variable_ram_start = .;
        *(.data)
        /* This variable is used to get the end of .data section in RAM */
        __variable_ram_end   = .;
    } > RAM AT > ROM

    .bss : {
        *(.bss)
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*)
    }
}
