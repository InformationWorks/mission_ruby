#This is a class for player object
class Player
	attr_accessor :name,:marker,:has_won,:is_winner;
	

#This will ask the player for the name , and will show the markers to user.
	def initialize(player_number,marker_local)
		print "\nPlayer #{player_number} , Enter your name :"
		@name=gets.chomp
		@marker=marker_local
		if player_number>1 then
			print "wel come to game #{@name}!!"
		else
			print "Hello,#{@name}."
		end
		print " You will be playing with '#{@marker}'\n\n"
		@has_won=0
		@player_vector_count=Hash[1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0]
	end

#Earses the @player_vector_count , and set it to 0 for new match
	def nullify
		@player_vector_count.each_key do |key|
			@player_vector_count[key]=0
		end
		is_winner=false
		@is_winner=false
	end

#Update the @player_vector_count with coming array and set player winner if he is
	def consider(cell_vector)
		cell_vector.each do |vector|
			@player_vector_count[vector]= @player_vector_count[vector]+1
			if @player_vector_count[vector]==3 then
				@is_winner=true
			end
		end			
	end

	def declare_winner
		puts "Yuppieee...Congratulations,#{@name} !! You have won the match"	
		@has_won=@has_won+1	
	end	
end
#


