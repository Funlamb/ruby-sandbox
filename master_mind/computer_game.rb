require_relative "board.rb"
require_relative "formating.rb"
require_relative "instructions.rb"

class ComputerGame
    include Formating
    include Instructions
    
    def start ()
        @board = Board.new
        puts ask_user_for_code
        user_given_password = @board.get_valid_guess
        @board.set_password(user_given_password)
        puts "Thank you for the code. The computer will now try to guess your code."
        @guesses = make_all_guesses
        computer_guess = 1122.to_s
        clue = @board.give_feedback(computer_guess)
        11.downto(1) do |turn| 
            prune_bad_guesses(clue, computer_guess)
            computer_guess = @guesses[rand(@guesses.length)]
            clue = @board.give_feedback(computer_guess)
            if @board.check_if_correct(computer_guess)
                display_computer_victory(computer_guess.chars, turn)
                return true
            end
            display_computer_feedback(computer_guess.chars, clue, turn)
            sleep(1)
        end
    end

    def prune_bad_guesses (clue, last_guess)
        guesses_to_delete = []
        local_guesses = @guesses
        local_guesses.each_with_index do |elm, index|
            if give_feedback(elm.to_s, last_guess.to_s) != clue
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
        last_guess.zip(str_prune).each_with_index do |(pw_element, str_elm), turn|
            if pw_element == str_elm
                correct_spot_and_color += 1
                correct_spot_index.push(turn)
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
        (1..6).each do |turn|
            (1..6).each do |j|
                (1..6).each do |k|
                    (1..6).each do |l|
                        guesses.push (turn.to_s + j.to_s + k.to_s + l.to_s)
                    end
                end
            end
        end
        guesses
    end
end