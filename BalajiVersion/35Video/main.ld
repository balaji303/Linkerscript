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
sample = 170;
this.is.valid = 1M;
"this is valid" = 2M;
/* this is not valid = 3M; */
_ThisIsValid = 3M;
"SECTIONS" = 24k; /*This is also valid since under quotes*/

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
        . = . + sample;
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*)
    }
}
