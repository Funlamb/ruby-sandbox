class Board
    # make a random password out of 6 colors/numbers
    def initialize ()
        @password = make_password()
    end

    def make_password = 4.times.map {rand 1..6 }.join

    def get_password 
        @password
    end

    def check_if_correct(str_guess)
        @password == str_guess
    end

    def give_feedback(str_guess)
        # get correct guess color and spots
        password = @password.chars
        str_guess = str_guess.chars
        correct_spot_and_color = 0
        correct_spot_index = [] # used for checking correct colors later
        password.zip(str_guess).each_with_index do |(pw_element, str_elm), i|
            if pw_element == str_elm
                correct_spot_and_color += 1
                correct_spot_index.push(i)
            end
        end
        
        # delete guesses that matched color and spot so we don't get additional correct color guesses
        correct_spot_index.reverse_each do |del|
            password.delete_at(del)
            str_guess.delete_at(del)
        end
        
        # get correct color but wrong spots 
        correct_color = 0
        str_guess.each do |tg_elm|
            password.each_with_index do |pw_elm, index|
                if pw_elm == tg_elm
                    correct_color += 1
                    password[index] = ""
                end
            end
        end
        # maybe return the correct_spot_and_color and correct_color as an array to have main display text
        "You guessed #{correct_spot_and_color} in the correct spot and #{correct_color} correct colors in the wrong spot"
        [correct_spot_and_color, correct_color]
    end
end