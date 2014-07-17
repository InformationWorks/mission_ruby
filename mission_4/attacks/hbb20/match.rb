

#What is cell and vector & how they will be named:
#Tic-tac-toe board is 3 x 3 grid. each box will refered as cell
#There are 8 lines on tic-tac-toe board, By completing those lines player can win
# those are reffered as vector in this code
# 				A 			B 			C
#
# 1:  	1,4,7  |	1,5 	|	1,6,8
#	----------------------------------
# 2:  	 2,4   | 2,5,7,8| 	2,6
#	---------------------------------
# 3:  	3,4,8  |   3,5  |  3,6,7 
#
# Each row is assigned a numeric value and column is assigned a alphabetic value.
# cell will be refered as "<alphabetic_column_index><numeric_row_index"., say centeral cell will be named as B2.
# from above figure, choose and number out of 1 to 8 and connect the cells which contains that number
# It will form a vector with choosen number 
# For example: lets choose, number 7. Consider the cells having 7 in them e.g A1,B2,C3 ; The line passing through these points will be refered as 7th vector
# There is a hash with name  "game_cell_vectors" which contains cell value as key and array of vector numbers, passing through that cell as value. As shown in diagram.

#How the game will be eveluated.
# 
# Each player have player_vector_counts which is acutally a hash which has "vector" as key and count of player for that vector.
# Means when choosed A1 and A2 , vector 1=>1 count, vector 4=>2 count , vector 7=>1 count. Initially all the values will be 0 count.

# The count will be increased in "player_vector_count" for each vector of "game_cell_vector" for selected cell.
# When any count of user_vector_count reaches to 3, it means that player is winner.

class Match
	#New match will be initialized with the  2 players and game number in series
	
	#Removes the stored data of palyer moves done in last game 
	def initialize(player1_local,player2_local,game_number_local) 
		@player1=player1_local
		@player2=player2_local
		@game_number=game_number_local
		@player1.nullify
		@player2.nullify
		@cell_status=Hash["A1" => 0,"B1" => 0,"C1" => 0,"A2" => 0,"B2" => 0,"C2" => 0,"A3" => 0,"B3" => 0,"C3" => 0]
	@game_cell_vectors=Hash["A1"=>[1,4,7],"A2"=>[2,4],"A3"=>[3,4,8],"B1"=>[1,5],"B2"=>[2,5,7,8],"B3"=>[3,5],"C1"=>[1,6,8],"C2"=>[2,6],"C3"=>[3,6,7]]
		set_cell_status_null
		
	end

	#Removes the data of occupied cell
	def set_cell_status_null
		@cell_status.each_key do |key|
			@cell_status[key]=0
		end
	end	

	#This function will start A new match

	def start
		print_series_leaderboard #shows the series leaderboard status
		turn_number=0
		while turn_number<9 do
			turn_number=turn_number+1
			print_board
			player_on_turn=get_player_on_turn(turn_number)
			puts "#{player_on_turn.name}(#{player_on_turn.marker}) its your turn"
			choice = get_valid_empty_cell
			update_cell_status(turn_number,choice)
			player_on_turn.consider(@game_cell_vectors[choice])
			if player_on_turn.is_winner==true then
				print_board
				player_on_turn.declare_winner
				break
			end
			if turn_number==9
				puts "Game resulted in Draw"
			end	
		end
	end
#Prints the status of leaderboard. Number of current match, won matches by each player and draw match
	def print_series_leaderboard
		puts "Match number:#{@game_number} \t#{@player1.name}:#{@player1.has_won}\t#{@player2.name}:#{@player2.has_won}\tDraw:#{@game_number-1-@player1.has_won-@player2.has_won}"
	end

#prints the board on bases of user's entry
	def print_board
		cell_index=1
		puts "\n\n\t[A]\t[B]\t[C]"
		@cell_status.each_key do |cell|
			case cell
			when "A1" 
				print "    [1]\t #{marker_on_cell(cell)}"
			when "B1" 
				print "    |  #{marker_on_cell(cell)}"
			when "C1" 
				print "    |\t#{marker_on_cell(cell)}\n"
				puts "\t--------------------"
			when "A2" 
				print "    [2]\t #{marker_on_cell(cell)}"
			when "B2" 
				print "    |  #{marker_on_cell(cell)}"
			when "C2" 
				print "    |\t#{marker_on_cell(cell)}\n"
				puts "\t--------------------"
			when "A3" 
				print "    [3]\t #{marker_on_cell(cell)}"
			when "B3" 
				print "    |  #{marker_on_cell(cell)}"
			when "C3" 
				print "    |\t#{marker_on_cell(cell)}\n"
			end	
		end
	end

#return the marker which is stored in cell_status
	def marker_on_cell(cell)
		if @cell_status[cell]==2 then
			return "X"
		elsif @cell_status[cell]==1 then
			return "O"
		else
			return " "	
		end		
	end

#return a player1 if turn is odd and retuns player2 if turn is even
	def get_player_on_turn(turn)
		if turn%2==0 then
			return @player2
		else
			return @player1
		end		
	end

#It accepts inputs from user , 
#it returns that input only if that cell  is valid and empty 
	def get_valid_empty_cell
		print "\tEnter your move (i.e) A3 or a3:"
		while true do
			choice=gets.chomp
			choice=choice.capitalize
			if is_a_valid_position?(choice) then
				if is_an_empty_position?(choice) then
					return choice
				else
					print "\tThis cell is already occupied!! Choose other cell:"
				end
			else
				print "\tNot a valid position. e.g. A1.. Try Correct cell:"
			end
		end
	end

	#returns true id incoming value is valid position
	#A1 => true
	#1f => false
	#34ed => false
	#C3 => true
	def is_a_valid_position?(position_choice)
		rexp_for_cell=Regexp.new("[A-C]{1}[1-3]{1}$")
		if position_choice =~ rexp_for_cell then
			return true
		else
			return false
		end		
	end

	#returns true if the incoming cell is not yet occupied
	def is_an_empty_position?(position_choice)
		@cell_status[position_choice]==0?true:false
	end

	#this method set the cell status with appropriate number
	#will set 1 for player_1
	#will set 2 for player_2
	def update_cell_status(turn_number,choice)
		if turn_number%2!=0 then
			choice_value=1
		else
			choice_value=2
		end
		@cell_status[choice]=choice_value
	end
end

