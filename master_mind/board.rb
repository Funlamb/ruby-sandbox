class Board
    # make a random password out of 6 colors/numbers
    def initialize ()
        @password = make_password()
    end

    def get_password()
        @password
    end

    def make_password ()
        password = ""
        4.times do 
            n = 1 + Random.rand(6) # get random number from 1 to 6
            password += n.to_s # used a string for ease of use
        end
        password
    end

    def give_feedback(str_guess)
        # Check if guess is valid 
        # This should be split into it's own method
        guess = false
        this_guess = str_guess
        while (!guess)
            if this_guess.length != 4
                puts "Invalid guess: Try to guess 4 colors"
                this_guess = gets.chomp
            end
            if this_guess.length == 4
                guess = true
            end
        end
        # get correct guess color and spots
        password = @password.split("")
        this_guess = this_guess.split("")
        correct_spot_and_color = 0
        correct_spot_index = [] # used for checking correct colors later
        password.each_with_index do |element, i|
            if element == this_guess[i]
                correct_spot_and_color += 1
                correct_spot_index.push(i)
            end
        end
        # delete guesses that matched color and spot
        correct_spot_index.reverse.each do |del|
            password.delete_at(del)
            this_guess.delete_at(del)
        end

        # get correct color but wrong spots 
        correct_color = 0
        this_guess.each do |tg_elm|
            password.each_with_index do |pw_elm, index|
                if pw_elm == tg_elm
                    correct_color += 1
                    password[index] = ""
                end
            end
        end
        # maybe return the correct_spot_and_color and correct_color as an array to have main display text
        "You guessed #{correct_spot_and_color} in the correct spot and #{correct_color} correct colors in the wrong spot"
    end
end