Ruby Installation
=================


## What exactly happens when ruby is installed  ##

(I installed ruby using rbenv)
   
- Ruby is installed in ~/.rbenv/versions/2.1.2/bin directory.
 
- It also included following directories in $PATH variable.
     /home/hbb20/.rbenv/plugins/ruby-build/bin
     /home/hbb20/.rbenv/shims
     /home/hbb20/.rbenv/bin
 

- .rbenv allows user to use different version of ruby for different projects.
- All different versions of ruby get installed in ~/.rbvn/versions , with according version name.
- a executable ruby file is there in ~/.rbnv/shims , which links the project with executable ruby file under ~/.rbnv/versions/<appropriate version>/bin.
 
  
## Where does ruby get installed ##
- Ruby was insatalled in the following directory

    > ~/.rbenv/versions/2.1.2/bin

## Which files get installed ##

 - In ~/.rbenv/versions/2.1.2/bin directory, following files were installed.
     - bundle   
     - bundler  //manage gem dependencies  
     - erb //to embed ruby code in HTML 
     - erubis //implementation of eRuby
     - gem // serves as package (library) for ruby
     - irb //interactive ruby, which interepreat ruby 'line' on terminal 
     - rackup //
     - rails // framework for ruby developement
     - rake  // interface for web developement
     - rdoc  //documantaion system that extracts Rdoc prescribed comments , prepare a document
     - ri   // ruby-index, gives online ruby insrtuction 
     - ruby //Any ruby source code is interpreted and executed by this
     - sprockets
     - testrb
     - thor // toolkit for building powerful command-line interfaces
     - tilt // thin interface over a bunch of different Ruby template engines
     - tt //thor template 

## How do we get access to Ruby from any location in command prompt? ##

 - By adding the executable ruby's directory in $PATH , ruby file can be executed from any location in command prompt. For that ruby's directory should be listed in .bashrc (scope is terminal) or .profile (scope is log in session).