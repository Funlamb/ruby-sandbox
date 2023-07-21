require_relative "player.rb"
require_relative "board.rb"

class GameState

    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
    end

    def start_new_game
        # game state
        game_on = true
        cur_player_turn = @player_1

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
                game_on = false
                puts game_board
                return cur_player_turn
            end
            # check if all spaces full
            if game_board.is_board_full?
                game_on = false
            end
            # Change player turn
            if cur_player_turn == @player_1
                cur_player_turn = @player_2
            else
                cur_player_turn = @player_1
            end
        end
    end
end