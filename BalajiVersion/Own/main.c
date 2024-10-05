/***
 * This is a sample file for Video13
 *
 *
 */
extern int unint_global;
extern int int_global;
extern char _ld_variable_data_start;
extern char _ld_variable_data_end;

void uoo(void)
{
    char *RAM_start = &_ld_variable_data_start;
    char *RAM_end = &_ld_variable_data_end;
}

int poo(void)
{
    int unint_local;
    unint_local = int_global + unint_global;
    return unint_local;
}

int foo(void)
{
    int unint_local;
    unint_local = int_global + unint_global;
    return unint_local;
}