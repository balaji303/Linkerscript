MEMORY
{
    SOME_NAME : ORIGIN = 0xA000, LENGTH = 0x1000
}

SECTIONS
{
    .text : {
        main.o (.text)
        side.o (.text)
    } > SOME_NAME

    .data : {
        main.o (.data)
        side.o (.data)
    } > SOME_NAME

    .bss : {
        main.o (.bss)
        side.o (.bss)
    } > SOME_NAME


    /DISCARD/ : {
        main.o(*)
        side.o(*)
    }
}
