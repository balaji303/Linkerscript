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
    } > ROM

    .data : {
        *(.data)
    } > RAM

    .bss : {
        *(.bss)
    } > RAM

    /* Const data types are considered from now */
    .rodata : {
        *(.rodata)
    } > ROM

    /DISCARD/ : {
        *(*)
    }
}
