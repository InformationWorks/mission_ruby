def fibo_rec(n)
	if n == 0 || n == 1
		return n
	else		
		return (fibo_rec(n-1)+fibo_rec(n-2))
	end
end
begin
  puts "\nenter number for fibonacci"
  puts "To exit enter '-1'\n"
  puts "Enter number:"
  number = gets.chomp
  n = number.to_i

  
  if /[^0-9]/.match(number)

    if number.to_i == -1
      puts "Exit"
    else
      puts "\nPlease enter valid positive integer\n"
    end
  else

    result = (0..n).inject do | string , n |
      string.to_s + "," + fibo_rec(n).to_s 
    end
    
    if n == 0
      result_arr = result
    else
      result_arr = result.split(",")
    end

    puts "\nResult:"
    puts "you have entered number '#{n}',so f(#{n})is: #{result_arr[n]} "
    puts "your series is: #{result}\n\n"
  end
end while n != -1
