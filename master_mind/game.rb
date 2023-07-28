require_relative "board.rb"

class Game
    def initialize
        @board = Board.new()
        puts @board.get_password
    end

    def start ()
        turns = 12
        while turns > 0
            guess = get_valid_guess()
            turns -= 1
            puts turns
        end
    end

    def get_valid_guess ()
        valid_guess = false
        while !valid_guess
            guess = gets.chomp
            if (guess =~ /[1-6]/ && guess.length == 4)
                puts "Valid Guess"
                valid_guess = true
                return guess
            else 
                puts "Invalid guess. Please enter 4 numbers from 1 to 6."
            end
        end
    end
end