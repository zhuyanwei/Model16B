//
// count the num SNPs for per .dat file in gene_info\  
//

#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <cstring>

using std::string;
using std::stringstream;
using std::ifstream;
using std::ofstream;
using std::cout;
using std::vector;

int main()
{
	int total = 0;
	int SNPsNum[300];
	for(int i=1; i<=300; i++)
	{
		vector<string> geneSNPsPer;
		stringstream ss;
		ss << i;
		string f_postfix = ss.str();
		string infile_s = "gene_" + f_postfix + ".dat";
		char infile[20];
		strcpy( infile, infile_s.c_str());
		ifstream in;
//		cout<<"\n"<<infile;
		in.open(infile);
		while( !in.eof())
		{
			string rs;
			in >> rs;
			if(rs[0]=='r')
			{
				geneSNPsPer.push_back(rs);
			}	
		}
		SNPsNum[i-1] = geneSNPsPer.size();
		total += SNPsNum[i-1];
		cout<<"\n"<<i<<"\t\t"<<total;
		in.close();
	}
	if( total != 9445)
	{
		cout<<"may loss some rs, the total = "<<total; 
	}
	ofstream out;
	string outfile_s = "SNPsNum.txt";
	char outfile[20];
	strcpy( outfile, outfile_s.c_str());
	out.open(outfile);	
	for(int i=0; i<300; i++)
	{
		out<<SNPsNum[i]<<"\n";
	}
	out.close();
	
	return 0;
}
