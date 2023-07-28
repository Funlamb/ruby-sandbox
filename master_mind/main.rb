require_relative "game.rb"
# Create Master Mind Game
# Get a password of 4 colors out of 6. 
# Colors can be used more than once.
# Give player 12 guesses
# Give player feedback on correct colors and correct locations
# Get computer to play as the guesser

# Make Game
@game = Game.new()
@game.start

# Get the password