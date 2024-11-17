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

/* A variables */
a = 10k;

SECTIONS
{
    /* Another variables */
    b = 2k;

    .text : {
        *(.text)
        /* Operations variables */
        c = (a + b);
        d = (a - b);
        e = (a * b);
        f = (a / b);
        g = (a && b);
        g = (a & b);
    } > ROM AT > ROM

    /* Const data types are considered from now */
    .rodata : {
        *(.rodata)
    } > ROM AT > ROM

    .data : {
        *(.data)
    } > RAM AT > ROM

    .bss : {
        *(.bss)
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*)
    }
}
