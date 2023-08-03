require_relative "board.rb"
require_relative "formating.rb"

class HumanGame
    include Formating

    def initialize
        @board = Board.new()
    end

    def start
        11.downto(0) do |turns|
            guess = @board.get_valid_guess
            if @board.check_if_correct(guess)
                display_human_victory(guess.chars, turns)
                return true
            end
            clues = @board.give_feedback(guess)
            correct_spot_and_color = clues[0]
            correct_color = clues[1]
            display_human_feedback(guess.chars, clues, turns)
        end
        display_human_loss (@board.get_password)
    end
end