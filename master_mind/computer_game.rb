require_relative "board.rb"
class ComputerGame
    # TODO Refactor
    def start ()
        user_given_password = get_valid_guess
        @board = Board.new
        @board.set_password(user_given_password)
        
        @guesses = make_all_guesses
        computer_guess = 1122.to_s
        clue = make_first_guess(computer_guess)
        # TODO Give user feed back about computer's moves
        1.upto(12) do |i| 
            prune_bad_guesses(clue, computer_guess)
            computer_guess = @guesses[rand(@guesses.length)]
            if @board.check_if_correct(computer_guess)
                return i
            end
            clue = @board.give_feedback(computer_guess)
        end
    end

    def make_first_guess(guess)
        @board.give_feedback(guess)
    end

    # TODO Refactor
    def prune_bad_guesses (clues, last_guess)
        guesses_to_delete = []
        local_guesses = @guesses
        local_guesses.each_with_index do |elm, index|
            if give_feedback(elm.to_s, last_guess.to_s) != clues
                guesses_to_delete.push(elm.to_s)
            end
        end
        @guesses -= guesses_to_delete
    end

    def give_feedback(str_prune, last_guess)
        # get correct guess color and spots
        last_guess = last_guess.chars
        str_prune = str_prune.chars
        correct_spot_and_color = 0
        correct_spot_index = [] # used for checking correct colors later
        last_guess.zip(str_prune).each_with_index do |(pw_element, str_elm), i|
            if pw_element == str_elm
                correct_spot_and_color += 1
                correct_spot_index.push(i)
            end
        end
        
        # delete guesses that matched color and spot so we don't get additional correct color guesses
        correct_spot_index.reverse_each do |del|
            last_guess.delete_at(del)
            str_prune.delete_at(del)
        end
        
        # get correct color but wrong spots 
        correct_color = 0
        str_prune.each_with_index do |tg_elm, index_tg| #3224 code 2443
            last_guess.each_with_index do |pw_elm, index|
                if pw_elm == str_prune[index_tg] && pw_elm != ""
                    correct_color += 1
                    last_guess[index] = ""
                    str_prune[index_tg] = ""
                end
            end
        end
        [correct_spot_and_color, correct_color]
    end

    def make_all_guesses
        guesses = []
        (1..6).each do |i|
            (1..6).each do |j|
                (1..6).each do |k|
                    (1..6).each do |l|
                        guesses.push (i.to_s + j.to_s + k.to_s + l.to_s)
                    end
                end
            end
        end
        guesses
    end
    
    # TODO Refactor Maybe move to board class
    def get_valid_guess
        loop do
            guess = gets.chomp
            if guess.match? /\A[1-6]{4}\z/
                return guess
            end
            puts "Invalid guess. Please enter 4 numbers from 1 to 6."
        end
    end
end