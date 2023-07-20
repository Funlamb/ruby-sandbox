require_relative "player.rb"
require_relative "board.rb"

# make tic tac toe
# use the command line
# make two players
puts "Please enter first player's name:"
player_1_name = gets.chomp
player_1 = Player.new(player_1_name, "X")
puts "Please enter second player's name:"
player_2_name = gets.chomp
player_2 = Player.new(player_2_name, "O")
# keep track of score
# game state
game_on = true
cur_player_turn = player_1

game_board = Board.new()
while (game_on)
    puts game_board

    valid_spot = false
    spot = nil
    while (!valid_spot)
        puts "#{cur_player_turn.get_name} pick an available space from 1 to 9:"
        spot = gets.chomp
        if (!game_board.valid_spot?(spot))
            puts "Invalid location"
        end
        if (game_board.valid_spot?(spot))
            valid_spot = true
        end
    end
    game_board.fill_spot(spot, cur_player_turn.get_letter)
    # check for win condition
    if winner = game_board.did_player_win?(cur_player_turn.get_letter)
        puts winner
        puts "#{cur_player_turn.get_name} Won!"
        cur_player_turn.add_point(1)
        game_on = false
    end
    # check if all spaces full
    if game_board.is_board_full?
        puts "Cats Game"
        game_on = false
    end
    game_on = true
end
