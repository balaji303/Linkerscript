/*

A new const variable Balaji is created and can be NOT found in map file
Since it is a const it is moved to .rodata which contains only
const datas

*/
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
