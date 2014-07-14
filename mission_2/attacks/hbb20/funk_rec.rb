require './fibo_new_common.rb'

#def --> fibo_rec
#This function accepts positive integer
#Funkonacci Numbers!
#
#funk(n) = 0 if n < 1
#funk(n) = 1 if n = 1
#funk(n) = funk(n - 1) - (2 × funk(n - 2)) otherwise 
#
#it calculate the and fill up the series[] with funkonacci numbers
#and finally returns series[]
$series =Array.new # global varible so that each recursion can use same one
def funk_rec(target_number)
  if target_number<1
	$series[0]=0
    return 0
 
  elsif target_number=1
  	$series[1]=1
  	funk_rec 0
    return 1
  	
  else
		ans=funk_rec(target_number-1)-2*(funk_rec(target_number-2))	
		$series[target_number]=ans
		return ans
	end
	return $series
end		


#Entry point of file which ask to enter target value until user wishes to exit
puts "Funkonacci series by recursion"
series_local = Array.new
while true do
  target_number=get_target_number
  if target_number == nil
	print "Invalid input! Enter integer value only."

  elsif target_number<0
	print "See you soon!! Bye!!\n"
	exit
  else
	$series.clear
	series_local.clear
	funk_rec(target_number) 
	$series.each do |i|
	  series_local.push(i)
	end
	print_output(series_local)
  end
end