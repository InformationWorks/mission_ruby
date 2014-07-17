require './match.rb'
require './player.rb'
class Tic_tac_toe
	
	def initialize
		print_oxo
		print_wel_come_message
		@player1=Player.new(1,"O")
		@player2=Player.new(2,"X")
		@total_games=0
	end
	
	def print_wel_come_message
		puts "\nWelcome to our well known game,Tick_tac_toe!!!!!"
		puts "This is Two player game,"
	end	

	def start
		while true do
			@total_games=@total_games+1
			match = Match.new(@player1,@player2,@total_games)
			match.start
			puts "\n\nDo you want to play another match? Enter 'Y' for another match:"
			want_to_play=gets.chomp.capitalize
			if want_to_play!="Y" then
				exit
			end
		end
	end	

	def print_oxo
		puts "\t\tO | X | O"
		puts "\t\t---------"
		puts "\t\tx | X | O"
		puts "\t\t---------"
		puts "\t\tO | X | O"
	end
end

