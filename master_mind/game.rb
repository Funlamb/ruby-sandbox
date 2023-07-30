require_relative "board.rb"
require_relative "formating.rb"

class Game
    include Formating

    def initialize
        @board = Board.new()
        # puts @board.get_password
    end

    def start ()
        11.downto(0) do |turns|
            guess = get_valid_guess()
            show_code(guess.chars)
            puts turns.to_s + " guesses left"
            if @board.check_if_correct(guess)
                return true
            end
            clues = @board.give_feedback(guess)
            correct_spot_and_color = clues[0]
            correct_color = clues[1]
            puts "You guessed #{correct_spot_and_color} in the correct spot and #{correct_color} correct colors in the wrong spot"

        end
        puts @board.get_password
    end

    def get_valid_guess ()
        loop do
            guess = gets.chomp
            if guess.match? /\A[1-6]{4}\z/
                return guess
            end
            puts "Invalid guess. Please enter 4 numbers from 1 to 6."
        end
    end
end