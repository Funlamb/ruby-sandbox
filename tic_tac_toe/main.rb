# require_relative "player.rb"
# require_relative "board.rb"
require_relative "game_state.rb"

# make two players
puts "Please enter first player's name:"
player_1_name = gets.chomp
player_1 = Player.new(player_1_name, "X")
puts "Please enter second player's name:"
player_2_name = gets.chomp
player_2 = Player.new(player_2_name, "O")

game_state = GameState.new(player_1, player_2)

def print_score (p1, p2)
    "\t#{p1.get_name} has #{p1.get_score} point(s).\n\t#{p2.get_name} has #{p2.get_score} point(s)."
end

play_a_game = true
while play_a_game
    winner = game_state.start_new_game
    if winner
        winner.add_point(1)
        puts "#{winner.get_name} Won!"
    else 
        puts "Cats game"
    end
    puts "Current score: "
    puts print_score(player_1, player_2)
    puts "Do you want to play again? Yes or No"
    answer = gets.chomp.downcase
    if answer == "yes" || answer == "y"
        play_a_game = true
    else 
        play_a_game = false
    end
end

puts "Game over."
puts print_score(player_1, player_2)