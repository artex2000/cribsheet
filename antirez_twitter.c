#define F float
F f[]=
{ 
     -.1, -.1,  1.7,    .8, -.11,  -6,    .4,  -.6,  .15,  -.3, .22, -3.1,  -.1,  -.06,   3.2,  .57, 
    -1.1,  19, -176,  -4.8, -7.2,  43,   -86,   40,   48,   65,  34,  803,   39,  9.65,   -17,  -33, 
     -33,  16, 1167,    63,  -23,  41, -22,9,  .56, -.08, 4.76,  -8, -.28,  .63, -1182, -7.27, 26.6, 
   -1213, 198,  5.3, -8.25, 38.4, .22,  -.78, -903, -7.4, -.26, .42, 47.5, 33.7,  36.5,  -184, 14.5, 
     -90, 3
};
F o[15];
F R(F A,F U)
{
    o[0] = A;
    o[1] = U;
    F a = 0;
    int k = 2, m = 3, n = 0, z = 0, l = 1;
    
    for(int j = 0; j < 67; j++) {
        if (j == 18)
            n = 2, z = 3, m = 7, l = -17;
        if (j == 60)
            n = 8, l = -59;
            
        if((j + l) % m){
            a += f[j] * o[n + (j + z) % m];
        } else{
            o[k++] = (F)1 / (1 + exp(-(a + f[j])));
            a = 0;
        }
    }return o[14];
}

main()
{
    for(int i = 0; i < 2201; i++) {
        putchar(R(i % 55, i / 55 - 5)> .5 ? 58 : 32);
        if(!(i % 55))
            putchar(10);
    }
}