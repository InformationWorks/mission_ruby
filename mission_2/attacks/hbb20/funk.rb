require './fibo_new_common.rb'

#def --> funk
#Funkonacci Numbers!
#funk(n) = 0 if n < 1
#funk(n) = 1 if n = 1
#funk(n) = funk(n - 1) - (2 × funk(n - 2)) otherwise
#This function accepts positive integer 
#it calculate the and fill up the series[] with funkonacci numbers
#and finally returns series[]
def funk(target_number)
	a=0;
	b=1;
	series = Array.new #this global variable will contains series 
	(0..target_number).each do |i|
		if i<2
			series[i]=i
		else
			c=b-(2*a)
			a,b=b,c
			series[i]=c
		end	
	end
	return series
end	

#Entry point of file which ask to enter target value until user wishes to exit
puts "Funkonacci series"
while true do
	target_number=get_target_number
	if target_number == nil
		print "Invalid input! Enter integer value only."

	elsif target_number<0
		print "See you soon!! Bye!!\n"
		exit
	else
		print_output(funk(target_number))
	end
end


