BEGIN { #prints message in starting
	puts "Good morning, this program will give you Fibonacci number"
	puts "Enter +ve numeric value of 'n'th position to get Fibonacci number"
	puts "Enter -ve value to exit \n\n"
}

$fibo_arry=[]
def is_num(input_value) #Checks if 
	is_a_num = Regexp.new("^[-+]?[0-9]\d*\.?[0]*$") #creates a regexp object that validate integer
	if input_value =~ is_a_num   #compare incoming value with integer regular expression
			return input_value.to_i
	else
		return "invalid"
		
	end
end

def fibo_rec(n)
	if n==0
		$fibo_arry[n]=n
		return 0

	elsif n==1 
		$fibo_arry[n]=n
		return 1
	else
		ans=fibo_rec(n-1)+(fibo_rec(n-2))	
		$fibo_arry[n]=ans
		return ans
	end
end		
	
def print_array(n)
	puts "entered in printing"
	(0...n+1).each do |i|
		puts "#{i}-->#{$fibo_arry[i]}"
	end
end		

while true do
		print "\nEnter a value:"
		n = gets
		_way=is_num(n)

		if _way=="invalid" then
			puts "Invalid Input"
		elsif _way>=0
			fibo_value_by_recursive=fibo_rec(_way)
			print_array(_way)
			puts "Fibonacco value found by recursive is #{fibo_value_by_recursive}"
		else 
			puts "Good Bye!!"
			exit
		end	
end