require './fibo_new_common.rb'




#def --> fibo
#This function accepts positive integer 
#it calculate the and fill up the series[] with fibonacci numbers
#and finally returns series[]
def fibo(target_number)
	a=0;
	b=1;
	series = Array.new #this global variable will contains series 
	(0..target_number).each do |i|
		if i<2
			series[i]=i
		else
			c=a+b
			a,b=b,c
			series[i]=c
		end	
	end
	return series
end	

#Entry point of file which ask to enter target value until user wishes to exit
puts "Fibonacci series by Iteration"
while true do
	target_number=get_target_number
	if target_number == nil
		print "Invalid input! Enter integer value only."

	elsif target_number<0
		print "See you soon!! Bye!!\n"
		exit
	else
		print_output(fibo(target_number))
	end
end


