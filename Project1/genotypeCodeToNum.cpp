// READ genotype.dat 
// and change the string to digital code

#include<stdio.h>
#include<assert.h>

int columns = 9445;
int rows = -1;
	int AA = 0;
	int AT = 0;
	int AC = 0;
	int AG = 0;
	int TT = 0;
	int TC = 0;
	int TG = 0;
	int CC = 0;
	int CG = 0;
	int GG = 0;
	
int codeGenotype(char c, char c1)
{
	int codeNum;
	
    if( c=='A')
    {
    	switch(c1)
    	{
    		case 'A': codeNum=0;  AA++; break;   // AA 0
    		case 'T': codeNum=1;  AT++; break;   // AT 1
    		case 'C': codeNum=2;  AC++; break;   // AC 2
    		case 'G': codeNum=3;  AG++; break;   // AG 3
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='T')
	{
		switch(c1)
    	{
    		case 'A': codeNum=1;  AT++; break;  // TA 1
    		case 'T': codeNum=5;  TT++; break;  // TT 5
    		case 'C': codeNum=6;  TC++; break;  // TC 6
    		case 'G': codeNum=7;  TG++; break;  // TG 7
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='C')
	{
		switch(c1)
    	{
    		case 'A': codeNum=2; AC++; break;  // CA 2
    		case 'T': codeNum=6; TC++; break;  // CT 6
    		case 'C': codeNum=10; CC++; break;  // CC 10
    		case 'G': codeNum=11; CG++; break;  // CG 11
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='G')
	{
		switch(c1)
    	{
    		case 'A': codeNum=3; AG++; break;  // GA 3
    		case 'T': codeNum=7; TG++; break;  // GT 7
    		case 'C': codeNum=11; CG++; break;  // GC 11
    		case 'G': codeNum=15; GG++; break;  // GG 15
    		default:
    			assert("illegal char c1");
		}
	}
	else
	{
		assert("illegal char c");
	}
	return codeNum;
}

int main()
{
	FILE* fp    = fopen("genotype.dat", "r");
	FILE* fpout = fopen("genotype.txt", "w");
	char c;
	
	while( (c=getc(fp)) != EOF)
	{
		if( c=='I')
		{
			c='T';
		}
		else if( c=='D')
		{
			c='C';
		}
		
		if( ! (c=='A' || c=='T' || c=='C' || c=='G') && fpout != NULL)
		{
//			if( c=='\n')
//			{
//				++rows;
//			}
//			
			if( ( c==' ' || c=='\n') )
			{
                 fprintf(fpout, "%c", c);
			}
			else
			{
				
			}
		}
		else
		{
			char c1;
			int codeNum = -1;
			c1 = getc(fp);
			if( c1=='I')
			{
				c1='T';
			}
			else if( c1=='D')
			{
				c1='C';
			}
			codeNum = codeGenotype(c, c1);	
			
			fprintf(fpout, "%d", codeNum);
		}
	}
	
	printf("\nAA: %d \nAT: %d \nAC: %d \nAG: %d \nTT: %d \nTC: %d \nTG: %d \nCC: %d \nCG: %d \nGG: %d\n", AA, AT, AC, AG, TT, TC, TG, CC, CG, GG);
	return 0;
}
