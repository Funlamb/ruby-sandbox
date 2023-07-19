# init the board
# check for win
# place a piece
class Board
    def initialize
        @game_board = Array.new(9) {|i| (i+1)}
    end
    
    def to_s
        s = @game_board[0].to_s +  " | " + @game_board[1].to_s +  " | " + @game_board[2].to_s + "\n" +
            "--+---+--\n" + 
            @game_board[3].to_s +  " | " + @game_board[4].to_s +  " | " + @game_board[5].to_s + "\n" +
            "--+---+--\n" + 
            @game_board[6].to_s +  " | " + @game_board[7].to_s +  " | " + @game_board[8].to_s + "\n"; 
        return s;
    end
    # puts @game_board
end