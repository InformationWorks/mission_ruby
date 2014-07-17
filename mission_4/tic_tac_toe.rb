require './match.rb'
require './player.rb'
class Tick_tac_toe
	@total_games=0
	def intialize
		print_wel_come_message
		@player1=Player.new(1,"O")
		@player2=Player.new(2,"X")
	end
	
	def print_wel_come_message
		puts "Welcome to our well known game,Tick_tac_toe!!!!!"
		puts "You simply need to enter move position in proper format like A1 or B3"
		puts "This is Two player game,"
	end	

	def start
		while true |
			@total_games=@total_games+1
			match = Match.new(@player1,@player2,@total_games)
			match.start
			put "\n\nDo want to play another match? Enter 'Y' another match?"
			want_to_play=gets.capitalize!
			if want_to_play!="y" then
				exit
			end
		end

		
	end

