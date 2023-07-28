require_relative "board.rb"

class Game
    def initialize
        @board = Board.new()
        puts @board.get_password
    end

    def start ()
        12.downto(0) do |turns|
            guess = get_valid_guess()
            # turns -= 1
            puts turns
            puts @board.give_feedback(guess)
        end
    end

    def get_valid_guess ()
        loop do
            guess = gets.chomp
            if guess.match? /\A[1-6]{4}\z/
                puts "Valid Guess"
                return guess
            end
            puts "Invalid guess. Please enter 4 numbers from 1 to 6."
        end
    end
end