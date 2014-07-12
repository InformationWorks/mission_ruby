BEGIN { #prints message in starting
	puts "Good morning, this program will give you Fibonacci number"
	puts "Enter +ve numeric value of 'n'th position to get Fibonacci number"
	puts "Enter -ve value to exit \n\n"
}

def is_num(input_value) #Checks if 
	is_a_num = Regexp.new("^[-+]?[0-9]\d*\.?[0]*$") #creates a regexp object that validate integer
	if input_value =~ is_a_num   #compare incoming value with integer regular expression
			return input_value.to_i
	else
		return "invalid"
		
	end
end

def fibo(n)
	a=0;
	b=1;
	puts "Calls iteretive method"
	(0...n+1).each do |i|
		print "#{i}-->"
		if i<2
			puts "#{i}"
		else
			c=a+b
			a,b=b,c
			puts "#{c}"
		end	
	end	
end

while true do
		print "\nEnter a value:"
		n = gets
		_way=is_num(n)

		if _way=="invalid" then
			puts "Invalid Input"
		elsif _way>=0
			
			fibo(_way)
			
		else 
			puts "Good Bye!!"
			exit
		end	

end





