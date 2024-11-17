// these variables are used in bbb.c file
extern int x;
extern int fun_retn(void);

//Yes there is no Main function
int fun_main(void)
{
    int z = x + fun_retn();
    return z;
}