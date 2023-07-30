require_relative "game.rb"
require_relative "instructions.rb"
require_relative "formating.rb"

# Make Game
class Main 
    include Instructions
    include Formating

    def start
        puts "Please enter your name:"
        @player_name = gets.chomp
        # Give the rules of the game
        #{code_colors('1')}Welcome, #{@player_name},
        puts instructions

        
        @game = Game.new()
        @game.start
    end
end

main = Main.new
main.start
# Get the password