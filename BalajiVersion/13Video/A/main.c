/***
 * This is a sample file for Video13
 * 
 * 
 */
int unint_global;
int int_global = 13;

int foo(void)
{
    int unint_local;
    unint_local = int_global + unint_global;
    return unint_local;
}