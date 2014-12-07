def fibo(num)
	for num in 0..num
		if num == 0 || num == 1
			return num  
		else		
			return (num-1)+(num-2)
		end
		
	end

end
begin
  puts "\nenter number for fibonacci"
  puts "To exit enter '-1'\n"
  puts "Enter number:"
  number = gets.chomp
  num = number.to_i

  
  if /[^0-9]/.match(number)

    if number.to_i == -1
      puts "Exit"
    else
      puts "\nPlease enter valid positive integer\n"
    end
  else

    result = (0..num).inject do | string , num |
      string.to_s + "," + fibo(num).to_s 
   end
   if num == 0
      result_arr = result
    else
      result_arr = result.split(",")
    end

   puts "\nResult:"
    puts "you have entered number '#{num}',so f(#{num})is: #{result_arr[num]} "
    puts "your series is: #{result}\n\n"
  end
end while num != -1

 
