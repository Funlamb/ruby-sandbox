class Board
    # make a random password out of 6 colors/numbers
    def initialize ()
        @password = make_password()
    end

    def get_password()
        @password
    end

    def make_password = 4.times.map {rand 1..6 }.join

    def give_feedback(str_guess)
        # get correct guess color and spots
        password = @password.chars
        str_guess = str_guess.chars
        correct_spot_and_color = 0
        correct_spot_index = [] # used for checking correct colors later
        password.each_with_index do |element, i|
            if element == str_guess[i]
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
        str_guess.zip(password).each_with_index do |(tg_elm, pw_elm), index|
            if pw_elm == tg_elm
                correct_color += 1
                password[index] = ""
            end
        end
        # maybe return the correct_spot_and_color and correct_color as an array to have main display text
        "You guessed #{correct_spot_and_color} in the correct spot and #{correct_color} correct colors in the wrong spot"
    end
end