require_relative "board.rb"
# Create Master Mind Game
# Get a password of 4 colors out of 6. 
# Colors can be used more than once.
# Give player 12 guesses
# Give player feedback on correct colors and correct locations
# Get computer to play as the guesser

# Make Board
board = Board.new()
puts board.get_password

guess = gets.chomp
puts ""
print board.give_feedback(guess).to_s
# Get the password