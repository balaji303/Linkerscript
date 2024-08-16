//Comments are added after the steps

int initialised_global = 1; // .data section
int un_initialised_global; //.bss section
int un_initialised_global_array[4]; //.bss section

static int static_initialised_global = 2; // .data section
static int static_un_initialised_global;//.bss section

// This function starts at 0x8000
void sample_fun() // .text section
{
    int initialised_local = 3; // Removed by Compiler for optimization
    int un_initialised_local; // Removed by Compiler for optimization
    int un_initialised_local_array[4]; // Removed by Compiler for optimization

    static int static_initialised_local = 4; // .data section
    static int static_un_initialised_local;//.bss section

}