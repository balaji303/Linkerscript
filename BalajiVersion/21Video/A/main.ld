/*A new variable Balaji is created and can be found in map file*/
MEMORY
{
    /* Instead of SOME_NAME, RAM is used*/
    RAM : ORIGIN = 0xA000, LENGTH = 0x1000
}

SECTIONS
{
    .text : {
        *(.text)
    } > RAM

    .data : {
        *(.data)
    } > RAM

    .bss : {
        *(.bss)
    } > RAM


    /DISCARD/ : {
        *(*)
    }
}
