#include <iostream>  //libraries found at /usr/inculde/c++/4.8
#include <cstdlib>
int sum(char  n1[],char n2[]);
int main(int c,char* arry[]) //varient of main that accepts command line argument, c, first parameter is count of passed argument. arry is array of arguments,first argument is file name it self at arry[0]
{
 using namespace std; // uses std ~standard namspace defined in all included files

	cout <<"sum is the "<<sum(arry[1],arry[2]) <<"\n"; //prints answer
	
return 0; //  main() return
		
}

int sum(char n1[],char n2[])
{
	int num1=atoi(n1); //function of cstdlib that converts string to number
	int num2=atoi(n2);//cstdlib is directly linked to stdlib.h of gcc.
	return num1 + num2;

}


