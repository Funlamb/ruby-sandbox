require_relative "human_game.rb"
require_relative "computer_game.rb"
require_relative "instructions.rb"
require_relative "formating.rb"

# Make Game
class Main 
    include Instructions
    include Formating

    def start
        print "Please enter your name: "
        @player_name = gets.chomp
        puts ""
        puts instructions

        # This loop asks the user if they want to play again.
        play_game = 'y'
        until play_game != 'y' do
            puts make_choice
            game_choice = game_selection
            code_maker if game_choice == '1'
            code_breaker if game_choice == '2'
            puts play_again
            # ask user if they want to play again
            play_game = gets.chomp.downcase
        end
    end
    
    def game_selection
        input = gets.chomp
        return input if input.match(/^[1-2]$/)
        puts "Must choose 1 or 2"
        game_selection
    end

    def code_maker
        game = ComputerGame.new
        puts game.start
    end

    def code_breaker
        game = HumanGame.new
        game.start
    end
end

main = Main.new
main.start