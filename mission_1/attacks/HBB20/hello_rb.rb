#!/usr/bin/env ruby

num1= ARGV[0].to_i
num2= ARGV[1].to_i

def add(num1, num2)
  return num1 + num2
end

puts "sum is #{add(num1,num2)}"