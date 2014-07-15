#this is member class. Intance of this class will be librery student members.
class Member
	attr_accessor :mem_id,:mem_name
	def initialize(id,name)
		@mem_id=id
		@mem_name=name
		#puts "member created with #{@mem_id} and #{@mem_name}"
	end
end