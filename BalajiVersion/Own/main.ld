/*

After adding .rodata section in linker
 Const data types are considered from now
They can also be seen on the map file

*/

/* Entry Point */
/*ENTRY(Reset_Handler)*/

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
    /* Provide hidden symbol */
    PROVIDE_HIDDEN(_some_symbol = 0x1234);

    .text : {
        . = ALIGN(32);
        *(.text)
        /* Ensures that a section or symbol is not discarded during linking */
        KEEP (*(.init))
        /* Operations variables */
        c = (a + b);
        d = (a - b);
        e = (a * b);
        f = (a / b);
        g = (a && b);
        g = (a & b);
        . = ALIGN(32);
    /*> Execution and Stored AT > */
    } > ROM AT > ROM

    /* Const data types are considered from now */
    .rodata : {
        . = ALIGN(32);
        *(.rodata)
        . = ALIGN(32);
    } > ROM AT > ROM

    /* Used by the startup to initialize data */
    /* _sidata = LOADADDR(.data); */

    .data : {
        . = ALIGN(32);
        /* This variable is used to get the start of .data section */
        _ld_variable_data_start = .;
        *(.data)
        /* This variable is used to get the end of .data section */
        _ld_variable_data_end   = .;
        . = ALIGN(32);
    } > RAM AT > ROM

    .bss : {
        . = ALIGN(32);
        *(.bss)
        . = . + sample;
        . = ALIGN(32);
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*)
    }
}
