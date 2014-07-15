
require 'yaml'
require './Member.rb'
require './Book.rb'

class Library
	
	#this is a method which will be called after each operation
	#this shows the number option for operations
	def print_option_list
		puts "\n\nChoose an option"
		puts "1. View all books."
		puts "2. View all members."
		puts "3. Issue book to a member."
		puts "4. Check book availability."
		puts "5. Accept book returned by a member."
		puts "6. Add book."
		puts "7. Exit out"
		print "Enter you choice:"
	end


	#This function will load the book data from yml file
	#and Will create a object of book per entry in yml file
	#Finally it will push the book in @books
	def load_book_data_from_yml
		@last_book_id=0
		yml_book = YAML.load_file 'library_book_data.yml'
		yml_book.each_key do |key| 
			@books.push(Book.new(key.to_i,yml_book[key]['book_name'],yml_book[key]['author_name'],yml_book[key]['issued_to'].to_i))
			if @last_book_id<key.to_i then
				@last_book_id=key.to_i
			end
		end
		#puts "#{yml_book.length} Book(s) loaded successfully"
	end

	#This function will load Student memeber data from yml file
	#It will create member object and will push it to @members
	def load_member_data_from_yml
		yml_member = YAML.load_file 'library_member_data.yml'
		yml_member.each_key do |key| 
			@members.push(Member.new(key.to_i,yml_member[key]['mem_name']))
		end
		#puts "#{yml_member.length} Member(s) loaded successfully"
	end

	#Assigns the library name and load the Books data and memeber data in program variables
	def initialize(l_name)
		@books = Array.new 
		@members = Array.new
		@library_name=l_name #Set the library name with passed parameter.
		puts "-------\nWelcome to '#{@library_name}' Library, The world's Best library\n-------"
		load_book_data_from_yml
		load_member_data_from_yml
		#puts "books loaded=#{@books.length} member loaded=#{@members.length}"
		#print_book_list
		#print_member_list
	end	

	#this method will print the list of all books from @books
	def print_book_list
		puts "\nList of book and its current status:"
		puts "Book_ID\tBook Name\tBook Author\tIs Issued?\tIssued To whom?"
		puts "-------\t---------\t-----------\t----------\t---------------"
		@books.each do |book|
			puts "#{book.book_id}\t:#{book.book_name}\t:#{book.author_name}\t:#{if (book.issued_to>0) then "Yes" else "No" end}\t\t:#{get_library_member_name_by_id(book.issued_to)}"
		end
	end

	#This method print the member list with the id name and number of pending books
	def print_member_list
		puts "\nList of Library Student member and their pending books"
		puts "Student ID\t:Student Name\t:Pending books"
		@members.each do |member|
			puts "#{member.mem_id}\t\t:#{member.mem_name}\t:#{get_pending_books(member.mem_id)}"
		end
	end

	#search through the member array to metch the target id
	#And return the name of  member
	# If member will not found -- will be returned
	def get_library_member_name_by_id(target_id)
		if target_id.to_i< 0 then
			return "--"
		end
		@members.each do |member|
			if member.mem_id == target_id.to_i then
				return member.mem_name
				
			end
		end
	end

	#Search through the book array to metch the target book id
	#And return the name of  book
	#It assumes that registered book_id is being passes
	def get_library_book_name_by_id(target_book_id)
		@books.each do |book|
			if book.book_id == target_book_id.to_i then
				return book.book_name
			end
		end
	end

	#is_member_exist_in_library? returns true if member found in @members
	#Otherwise returns false
	def is_member_exist_for_library?(target_member_id)
		@members.each do |member|
			if member.mem_id == target_member_id.to_i then
				return true
			end
		end
		return false
	end

	#is_book_exist accepts book_id as param
	#Search for the book through out the array
	def is_book_exist_in_library?(target_book_id)
		@books.each do |book|
			if book.book_id == target_book_id.to_i then
				return true
			end
		end
		return false
	end

	#This method checks the issued status of book 
	#And return the true if book is not issued
	def is_book_available_in_library?(target_book_id)
		@books.each do |book|
			if book.book_id == target_book_id.to_i then
				if book.issued_to<0 then
					return true
				else
					return false
				end
			end
		end
		return false
	end

	#This method returns the number of books issued to the student and yet not returnded 
	def get_pending_books(target_member_id)
		number_of_books=0
		@books.each do |book|
			if book.issued_to == target_member_id.to_i then
				number_of_books=number_of_books+1
			end
		end
		return number_of_books
	end	

	#check_book_availability_in_library prints the message according to issued to status
	#if book is not given to any one, it write "Book is available"
	#if book is already issued to some one, it writes  "Book is not available"
	#if book does not exist to library, it writes "No such book is registered"
	def check_book_availability_in_library
		puts "To check availability of book,"
		print " Enter Book Id :"
		target_book_id=gets.to_i
		if is_book_exist_in_library?(target_book_id)	then
			if is_book_available_in_library?(target_book_id) then
				puts "\tBook is available"
			else
				puts "\tThat book is not available"
			end
		else
			puts "\tNo such book with Book ID #{target_book_id} rergistered in library"		
		end
	end
		
	#This method simply find the book with book_id and will register it with the member id.
	def register_book_to_member(target_book_id,target_member_id)
		@books.each do |book|
			if(book.book_id)==target_book_id.to_i then
				book.issue_to_member(target_member_id.to_i)
				break
			end
		end		
	end

	#This method return the member_id and member_name only if user enter a valid and registered user
	def get_registered_member_id_and_name
		while true do
			print "\n Enter a member ID :"
			member_id=gets.to_i
			if is_member_exist_for_library?(member_id) then
				member_name=get_library_member_name_by_id(member_id)
				puts "\tMember found :#{member_name}"
				return member_id,member_name
			else
				puts "\tSorry!! No member found with ID #{member_id}, Correct it please!!!"
			end
		end
	end

	#This method returns the book_id and book_name only if user enter a valid and available book
	def get_available_book_id_and_name
		while true do
			print "\n Enter a Book ID :"
			book_id=gets.to_i
			if is_book_exist_in_library?(book_id) then
				if is_book_available_in_library?(book_id) then
					return book_id,get_library_book_name_by_id(book_id)
				else
					puts "\tSorry !! Book is already issued , not available to you. Try another book!!"
				end
			else
				puts "\tNo such book with book ID #{book_id} is Registered with library, Correct it please!!!"
			end
		end
	end

	#This method will ask for memeber ID, book ID
	#If member exist and book is available
	#Method will change book object's status
	def issue_library_book_to_member
		member_id,member_name=get_registered_member_id_and_name
		book_id,book_name=get_available_book_id_and_name
		register_book_to_member(book_id,member_id)
		puts "\tDone!! A book '#{book_name}' has been issued to #{member_name} "
	end


	#This function mark the book returned 
	def mark_return(target_book_id)
		@books.each do |book|
			if(book.book_id)==target_book_id.to_i then
				book.mark_as_return
				return
			end
		end
	end

	#This is a function which check the status of book, and mark as return if it was actually resereved by some one
	def get_library_book_return
		puts "To return a book,"
		print " Enter Book Id :"
		target_book_id=gets.to_i
		if is_book_exist_in_library?(target_book_id)	then
			if is_book_available_in_library?(target_book_id) then
				puts "\tBook is not issued to any one.It is already available in library"
			else
				mark_return(target_book_id)
				puts "\tBook successfully marked as Return"
			end
		else
			puts "\tNo such book with #{target_book_id} rergistered in library"		
		end
	end
	#This method Asks for new book name and its author name, then register it to library
	def add_new_library_book
		puts "To add new book to library, You need to enter book name and book's author name"
		print "\tEnter New Book name:"
		new_book_name=gets.chomp
		print "\tEnter Author name:"
		new_book_author_name=gets.chomp
		@last_book_id=@last_book_id+1
		book=Book.new(@last_book_id,new_book_name,new_book_author_name,-1)
		@books.push(book)
		puts "New book '#{new_book_name}' has been added to library with book ID #{@last_book_id}"
	end

	def start
		while true
			print_option_list
			case gets.to_i
				when 1 #option1 
					print_book_list
		
				when 2	#option2
					print_member_list

				when 3#option3
					issue_library_book_to_member
		
				when 4#option4	
					check_book_availability_in_library

				when 5#option5
					get_library_book_return

				when 6 #option6
				add_new_library_book

				when 7
				puts "Hope you were satisfied with our #{@library_name} library!! Good Bye!!"
				exit
			end
		end
	end
end