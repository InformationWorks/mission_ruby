###
# Q. Why does line 26 not print out "false" when we marked taken as true by calling mark_taken_as_true on line 25?
###

class Book
  attr_accessor :taken

  def is_available?
    if taken == false 
      return true
    else
      return false
    end
  end

  def mark_taken_as_true
    taken = true
  end
end

book = Book.new
puts book.is_available?   #- false
book.taken = false
puts book.is_available?   #- true, is_available? not returns true as we set the value of taken as false.
book.mark_taken_as_true   # This does not update value of taken. Why?
puts book.is_available?   #- true

#Reason expained:
# code on line 23 will make instance variable taken, false.
# line 24 will check instance variable. And will return the value true on that bases.
# line 25 will call mark_taken_as_true function, that function will create a local variable named as taken , and will hide the instance variable
# line 17 will make that local variable "taken" true, whice does not affect the instance variable.
# If we change line 17: from
#       taken = true
#to
#       @taken = true
# Then 
#output will be:
#false
#true
#false