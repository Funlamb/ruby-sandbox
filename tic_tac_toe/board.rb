# init the board
# check for win
# place a piece
class Board
    def initialize
        @game_board = Array.new(9) {|i| (i+1)}
    end
    
    # define winning combonations
    WINNERS = [[0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [3,4,5], [6,7,8]]
    def did_player_win?(letter)
        # print @game_board.to_s + "\n"
        WINNERS.find do |list|
            @game_board
            # puts list
            .values_at(*list)
            .all?(letter)
        end
    end

    def is_board_full?
        !@game_board.any?(Numeric)
    end
    def to_s
        @game_board.each_slice(3).map {|row| row.join(" | ") }.join("\n--+---+--\n")
    end

    def valid_spot?(number)
        number = number.to_i
        if (!(number > 9 || number < 1 || (number.is_a?Integer)))
            return false
        end
        if (@game_board[number - 1].is_a?Integer)
            return true
        end
    end

    def fill_spot(num, sym)
        num = num.to_i
        @game_board[num - 1] = sym
    end 
end