MEMORY
{
    SOME_NAME : ORIGIN = 0xA000, LENGTH = 0x1000
}

SECTIONS
{
    .text : {
        main.o (.text)
        main.o (.data)
        main.o (.bss)
    } > SOME_NAME
}
