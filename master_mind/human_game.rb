require_relative "board.rb"
require_relative "formating.rb"

class HumanGame
    include Formating

    def initialize
        @board = Board.new()
        # puts @board.get_password
    end

    def start
        11.downto(0) do |turns|
            guess = @board.get_valid_guess
            show_code(guess.chars)
            if @board.check_if_correct(guess)
                return true
            end
            clues = @board.give_feedback(guess)
            correct_spot_and_color = clues[0]
            correct_color = clues[1]
            show_clues(correct_spot_and_color, correct_color)

            puts turns.to_s + " guesses left"

        end
        puts @board.get_password
    end
end