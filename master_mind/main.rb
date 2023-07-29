require_relative "game.rb"
# Create Master Mind Game
# Get a password of 4 colors out of 6. 
# Colors can be used more than once.
# Give player 12 guesses
# Give player feedback on correct colors and correct locations
# Get computer to play as the guesser

# Make Game
class Main 
    def start
        puts "Please enter your name:"
        @player_name = gets.chomp
        # Give the rules of the game
        puts "#{code_colors('1')}Welcome, #{@player_name}, to Mastermind. Your are tasked with breaking the computers code.
        You will have 12 guess to complete this chalenge. Once your have made a guess the computer will let
        you know if you have any colors in the correct spots and if you have any colors in incorrect spots. 
        With this feedback youshould be able to find the code."
        @game = Game.new()
        @game.start
    end
    def code_colors(number)
        {
          '1' => "\e[101m  1  \e[0m ",
          '2' => "\e[43m  2  \e[0m ",
          '3' => "\e[44m  3  \e[0m ",
          '4' => "\e[45m  4  \e[0m ",
          '5' => "\e[46m  5  \e[0m ",
          '6' => "\e[41m  6  \e[0m ",
        }[number]
      end
end

main = Main.new
main.start
# Get the password