/***
 * This is a sample file for Video13
 *
 *
 */

/* Variabled from side.c */
extern int unint_global;
extern int int_global;

/* Vriables from linker */
extern char _ld_variable_rodata_end;
extern char _ld_variable_data_start;
extern char _ld_variable_data_end;
extern char _ld_variable_bss_start;
extern char _ld_variable_bss_end;

int foo(void)
{
    int unint_local;
    unint_local = int_global + unint_global;
    return unint_local;
}

void customBalaji(void)
{
    char *ROM_data_start = &_ld_variable_rodata_end;
    char *RAM_start = &_ld_variable_data_start;
    char *RAM_end = &_ld_variable_data_end;
    char *BSS_start = &_ld_variable_bss_start;
    char *BSS_end = &_ld_variable_bss_end;

    /* Start of copy from ROM to RAM */
    /* Make Sure start has not reached end */
    while ( *RAM_start != *RAM_end )
    {
        /* copy the contents from ROM to RAM */
        *RAM_start = *ROM_data_start;
        /* Move to next RAM address */
        *RAM_start++;
        /* Move to next ROM address */
        *ROM_data_start++;
    }
    /* End of copy from ROM to RAM */

    /* Start of initialising .bss section to zero */
    while( *BSS_start != *BSS_end )
    {
        /* Make BSS to zero */
        *BSS_start = 0;
        /* Move to next BSS address */
        *BSS_start++;
    }
    /* End of initialising .bss section to zero */


}