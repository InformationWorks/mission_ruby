Program Details
=======

 - Class Required
     - Library
     - Member
     - Book
 - Attribute Required for each class
     - Library
         - library_name
         - last_book_id 
         - books
         - members
     - Member
         - member_id
         - member_name
     - Book
         - book_id
         - book_name
         - author_name
         - issued_to
 - Functions required for each class.
     - Book
         - mark_as_return
         - issue_to_member(member_id)
     - Library
         - print_option_list
         - load_book_data_from_yml
         - load_member_data_from_yml
         - print_book_list
         - print_member_list
         - get_library_member_name_by_id
         - get_library_book_name_by_id
         - is_member_exist_for_library?
         - is_book_exist_for_library?
         - is_book_available_in_library?
         - get_pending_books
         - check_book_availability_in_library
         - register_book_to_member
         - get_registered_member_id_and_name
         - get_available_book_id_and_name
         - issue_library_book_to_member
         - mark_return
         - get_library_book_return
         - add_new_library_book
         - start

Extra Credit
=======

 - Difference between *require* & *load*.
     - Both works to include any other file in current file code.
     - If one file has *require* multiple times for same external file, then that external file will be read once only. Once the file is read, it uses that memory data for all rest of *require*.
     - On other hand, *load* will read the file each time it is called. It reads recent updates as well.
 - Difference between *instance method* & *class method*
     - Instance methods are the methods which are particular object specific.Class methods are class specific, not for individual object.
     - Instance methods can use instance variables and class variable as well. class methods can not use instance member as its not object specific.
     - Instance method is called through the object. To  call class method , there is no need of object. 
     - instance methods can give call to class method but reverse is not possible
 - Difference between private & public instance method
     - Public methods are simply those which can be called by every object of that class and child-class of it.No exceptions.
     - Where else, private methods are obviously available to own. Unlike c++, in ruby private methods are visible to child-class, but condition is that it can be called with 'self' receiver.
     - The presented example on following link will clear the restrictions of private member. http://lylejohnson.name/blog/2003/12/09/private-methods-in-c-and-ruby/
 - Check book.rb and submit a file providing required explanation.
     - The explanation is given in book_explained.rb
 

    

     
                