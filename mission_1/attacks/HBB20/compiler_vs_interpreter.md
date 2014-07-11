## Compiler v/s Interpreter ##

Compiler and interpreter both are programs that have roles of bridge between high level language and machine level language. So both serve same purpose but uses different approaches.

----------

 - Compiler
     - Compiler is a computer program ,that accepts a source file , converts it to intermediate language that is called object file. This object file is directly executable by machine.
     - Compiler links the various libraries used and finally create a object file.
     - It takes time when source code is being converted to object file , but once object file is created, it takes very less amount of time in execution.  
     - Once the object code is created, no need to compile again unless the source code is changed. The object file can be executed number of times without being compiled. 
     - Compiler goes out of picture after compilation.
     - Compiler reports error of  source code after scanning of entire program. 
 - Interpreter
     - Unlike compiler, interpreter works line by line. It accepts one line of source code and converts it to intermediate code and execute that line.
     - Each time when executed, interpreter looks for a function definition.
     - It takes time in execution.
     - Interpreter, interpret the source code each time when code is executed.
     - Interpreter works till the entire code is successfully executed.
     - Interpreter reports an error as soon as faulty line comes in to execution.