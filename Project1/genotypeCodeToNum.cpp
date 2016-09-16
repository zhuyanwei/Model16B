// READ genotype.dat 
// and change the string to digital code

#include<stdio.h>
#include<assert.h>

int columns = 9445;
int rows = -1;

int codeGenotype(char c, char c1)
{
	int codeNum;
	
    if( c=='A')
    {
    	switch(c1)
    	{
    		case 'A': codeNum=0;  break;   // AA 0
    		case 'T': codeNum=1;  break;   // AT 1
    		case 'C': codeNum=2;  break;   // AC 2
    		case 'G': codeNum=3;  break;   // AG 3
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='T')
	{
		switch(c1)
    	{
    		case 'A': codeNum=1;  break;  // TA 1
    		case 'T': codeNum=5;  break;  // TT 5
    		case 'C': codeNum=6;  break;  // TC 6
    		case 'G': codeNum=7;  break;  // TG 7
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='C')
	{
		switch(c1)
    	{
    		case 'A': codeNum=2;  break;  // CA 2
    		case 'T': codeNum=6;  break;  // CT 6
    		case 'C': codeNum=10;  break;  // CC 10
    		case 'G': codeNum=11;  break;  // CG 11
    		default:
    			assert("illegal char c1");
		}
	}
	else if( c=='G')
	{
		switch(c1)
    	{
    		case 'A': codeNum=3;  break;  // GA 3
    		case 'T': codeNum=7;  break;  // GT 7
    		case 'C': codeNum=11;  break;  // GC 11
    		case 'G': codeNum=15;  break;  // GG 15
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
			
			codeNum = codeGenotype(c, c1);
			
			fprintf(fpout, "%d", codeNum);
		}
	}
	
	return 0;
}
