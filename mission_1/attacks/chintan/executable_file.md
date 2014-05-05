# how to make a executable file in ruby??
	first we have to write the environment path of the file from where the file is execute.
	#!/usr/bin/env ruby
	in this line the env is run a program in modified environment.

	most of the file have read and write acess.but we have to give a executable acess to the file.
	to give the acess of executable run the command ls -l hello.rb
	
	to execute the permisson the command is chmod 755 hello.rb

	rename the file and remove the extention .rb.
	mv hello.rb hello_rb
	
	now find the path using the command echo $PATH
	now create a softlink within the /usr/local/bin/ folder.


