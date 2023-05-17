int fib(){
    int n1=0;
    int n2=1;
    int n3;
    int i;
    int number = 10;
    for(i=2;i<number;++i)//loop starts from 2 because 0 and 1 are already printed    
    {    
    n3=n1+n2;
    n1=n2;
    n2=n3;
    asm volatile("add x28,x0, x0\n\t" 
        ); // optimization barrier
    }  

    return n3;
}

void entry()    
{    
 int n = fib();
asm volatile("add x28,x0, %[result]\n\t"   
: [result] "+r" (n) 
);
return;
 }