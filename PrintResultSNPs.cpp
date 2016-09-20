//
// print the final SNPs for sorted weights 
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
//			cout<<"\n"<<rs;
		}	
	}
	in_g.close();
	vector<double> sortedWeithtIndex;
	vector<double> sortedWeithts;
	ifstream in_sw;
//	string file_sw = "sorted_W.txt";
	string file_sw = "sorted_W_pro4.txt";
	char infile_sw[20];
	strcpy( infile_sw, file_sw.c_str());
	in_sw.open(infile_sw);
	
	while ( !in_sw.eof())
	{
		double rs;
		double sw;
		in_sw >> rs;
		in_sw >> sw;
//		if(rs[0]=='r')
		{
			sortedWeithtIndex.push_back(rs);
			sortedWeithts.push_back(sw);
		}
//		cout<<"\nrs: "<<rs;
//		cout<<"\nsw: "<<sw;
	}
	in_sw.close();
	
	ofstream out;
//	string outfile_s = "PrintSNPs_Weights.txt";   //pro2
    string outfile_s = "PrintSNPs_Weights_pro4.txt";
	char outfile[20];
	strcpy( outfile, outfile_s.c_str());
	out.open(outfile);	
    for(int i=0; i<sortedWeithtIndex.size(); i++)
    {
    	out<<"\nSNPs\t";
    	for(int j=0; j<4; j++)
    	{
    		out<<genotypeSNPsAll[ sortedWeithtIndex[i] ]<<"\t";
		}
		out<<"\nweights\t";
		for(int j=0; j<4; j++)
    	{
    		out<<sortedWeithts[ i ]<<"\t";
		}
	}
	out.close();
	
	return 0;
}
