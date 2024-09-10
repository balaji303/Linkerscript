/***
 * This is a sample file for Video13
 *
 *
 */
extern int unint_global;
extern int int_global;

int foo(void)
{
    int unint_local;
    unint_local = int_global + unint_global;
    return unint_local;
}