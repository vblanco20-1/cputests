extern int entry()    
{    
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
 }  
  return n3;  
 }