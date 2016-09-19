//
// verify the 300 geno_data SNPs is same order to the first row of genotype.dat 
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
using std::cout;
using std::vector;

int main()
{
	vector<string> geneSNPsPer;
	for(int i=1; i<=300; i++)
	{
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
//			cout<<"\n"<<rs;	
		}
	}
	vector<string> genotypeSNPsAll;
	ifstream in_g;
	string file_g = "genotype.dat";
	char infile_g[20];
	strcpy( infile_g, file_g.c_str());
	
	in_g.open(infile_g);
	
	while ( !in_g.eof())
	{
		string rs;
		in_g >> rs;
		if(rs[0]=='r')
		{
			genotypeSNPsAll.push_back(rs);
		}
	}
	
	if(geneSNPsPer.size() != genotypeSNPsAll.size() )
	{
		cout<<"\n not same size "<<geneSNPsPer.size()<<"  "<<genotypeSNPsAll.size();
	}
	else
	{
		for( int i=0; i< geneSNPsPer.size(); i++)
		{
			if(geneSNPsPer[i] != genotypeSNPsAll[i])
			{
				cout<<"\n not same geneSNPs "<<geneSNPsPer[i]<<"  "<<genotypeSNPsAll[i];					
			}
			else
			{
				cout<<"\nsame geneSNPs";
			}
		}
	}

	return 0;
}
