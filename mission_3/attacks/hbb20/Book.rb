# book class , its instances will hold library book data each
class Book
	attr_accessor :book_id,:book_name,:author_name,:issued_to
	#Initalialize method will assign the parameter values to instance variables
	def initialize(book_id,book_name,author_name,issued_to)
		
		@book_id,@book_name,@author_name,@issued_to=book_id,book_name,author_name,issued_to
		#puts "Book inited for #{@book_id}"
	end

	def mark_as_return
		@issued_to=-1
	end
  
  def issue_to_member(member_id)	
  	@issued_to=member_id
  end
 
end