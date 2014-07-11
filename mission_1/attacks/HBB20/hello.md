Creating .cpp  and .rb files Executable
==
This instruction file shows how to make c++ file and Ruby file directly executable from any location on Ubuntu. File that accepts two command line argument and prints the addition of those two integers.
1. How to make [c++] file executable
--

- Make sure that compiler for c++ is installed and working well on your system.
- Write following c++ code in a file and save it as hello_cpp.cpp
        
            #include <iostream>  //libraries found at /usr/inculde/c++/4.8
            #include <cstdlib>
            int sum(char  n1[],char n2[]);
            int main(int c,char* arry[]) //varient of main that accepts command line argument, c,first parameter is count of passed argument. arry is array of arguments,first argument is file name it self at arry[0]
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
- Compile the file 
      $g++ hello_cpp.cpp -o hello_cpp 
               
 By executing above code, file should be compiled successfully. (For those who uses g++ compiler)
                                                             
 After compilation, an executable file will be generated named as hello_cpp (as the argument given in g++ command)

- Run file (For surety of its working)
        $./hello_cpp 4 5
Execute this command to run code. And it should give following result on terminal
        sum is the 9

- To put file in proper directory. 

     The file can be executed from any where only if it is placed in Directory which is included in $PATH varible.
    check directory available in $PATH by giving following command.
        $PATH
now copy hello_cpp (not hello_cpp.cpp) this file in Directory which exist in the $PATH and also accessible to you.
- Done
    
 Now file is executable from any where in system , can be executed as below 
        $hello_cpp 4 9
        sum is the 13


2. How to make [.rb] file executable
--
- Make sure that ruby is installed in system.
- Write following ruby code in a file and save it as hello_rb.rb
        #!/usr/bin/env ruby   
                            //Bash directive which tells bash shell about what file to run for our code file.

        num1= ARGV[0].to_i
        num2= ARGV[1].to_i

        def add(num1, num2)
            return num1 + num2
        end

        puts "sum is the #{add(num1,num2)}"
        
- Run code (For surety that it works)
        ruby hello_rb.rb 5 7

  Execute this command to run code. And it should give following result on terminal
          sum is the 12
- Rename file
    File should be renamed to remove .rb from actual name so that there will be no need to write .rb when we execute. For that execute this command.
        $mv hello_rb.rb hello_rb
- Grant Execution permission for file
    To execute the file, it must be executable by current user. (Here current user is owener of file so 755 will give permission of execution to current user.)
        $chmod 755 hello_rb
-    Put the file in proper location.
    Copy and paste hello_rb file in directory that exist in $PATH.


- Done

    Now file is executable from any where in system , can be executed as below 
        $hello_rb 7 9
        sum is the 16
    
