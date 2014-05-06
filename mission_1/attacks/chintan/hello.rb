#!/usr/bin/env ruby
ARGV.each do|a|
  puts "Argument: #{a}"
end

a = ARGV[0].to_i
b = ARGV[1].to_i

puts "Result: " ,a+b