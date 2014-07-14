#This is a file that contains some functions that are required by fibo.rb and fibo_rec.

#def-->is_num
#This method accepts a parameter , and return true if passed value is n integer
# 45 # =>true
# a34 # =>false
# 43h # => false
# -4  # => true
def is_num?(input_value)
   (input_value =~ /^-?[0-9]+$/) == 0 ? true : false
end

#def--> get_target_number
#this method will  ask to enter a value.
#It will return numeric if value is valid integer and returns nil if it's invalid input\
def get_target_number
  print "\n\nEnter a positive integer or -ve number to exit: "
  input_value=gets
  is_num?(input_value)? input_value.to_i : nil
end

#def --> print_output
#this method accepts an array that contains fibonaci series
#prints fibonacci number on given position and then prints entire series
def print_output(series)
	puts "nth Fibonacci number is:#{series.at(series.length-1)}"
	print "Fibonacci series for n = #{series.length-1} is "
	series.each do |i|
		print "	#{i}"
	end
end






  	