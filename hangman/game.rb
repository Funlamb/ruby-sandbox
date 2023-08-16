class Game
    attr_reader :word_to_guess, :remaining_guesses, :letters_guessed

    def initialize()
        @word_to_guess = get_random_word
        @remaining_guesses = 10
        @letters_guessed = []
    end

    def load_game(game_to_load)
        # TODO: Load Game
        puts "TODO: Load Game"
    end

    def save_game
        # TODO: Save game
        puts "Save Game"
    end
    
    def start_game
        # TODO Start Game
        @word_to_guess = get_random_word
        @remaining_guesses = 10
        @letters_guessed = []
        core_game
    end

    def continue_game
        # TODO Continue Game
    end

    def core_game
        # show the player correct letters
        while @remaining_guesses > 0
            puts "You have #{remaining_guesses} wrong guesses before you loose the game."
            puts "Your word to guess: " + word_with_blanks(letters_guessed, word_to_guess)
            puts "What letter would you like to try? "
            # process letter input
            letter = get_valid_user_input(letters_guessed)

            @remaining_guesses -= 1
            puts "\e[H\e[2J"
        end
            # check if letter is good
            # show word if letter is good
            # maybe use gsub with the letters already chosen?

        # show player wrong letters used
        # clear cmd every input so game stays up top

        # win condition
        # lose condition

    end

    def get_random_word
        # Download the google words
        # Find words that are 5 to 12 letters long
        unless File.exist?('google-10000-words-between-5-12.txt')
            filtered_words = []
            filtered_words = File.foreach('google-10000-words.txt', chomp: true).select {
                _1.length.between?(5,12) }
            
            File.open('google-10000-words-between-5-12.txt', 'w') { _1.puts *filtered_words}
        end

        # load the words
        words = File.foreach('google-10000-words-between-5-12.txt', chomp: true).select{_1}
        word_to_guess = words[rand(words.length)] # select a word at random
        word_to_guess = 'helpme' # For testing
        word_to_guess
    end
    
    # show that player the word with blanks
    def word_with_blanks(regexp, word_to_guess)
        letters = regexp.join
        puts "Letters used:" + letters.to_s
        unless letters.empty?
            regexp = Regexp.new("[^#{letters}]")
            return word_to_guess.gsub(regexp, '_').chars.join(' ')
        end
        return '_ ' * word_to_guess.length 
    end
    
    def get_valid_user_input(letters_guessed)
        letter = gets.chomp
        if letter == 'save' # save condition
            return save_the_game(remaining_guesses, word_to_guess, letters_guessed)
        elsif letters_guessed.include?(letter) # make sure letter is not already used
            puts "Error: #{letter} already used. Please pick again"
            get_valid_user_input(letters_guessed)
        elsif letter.length != 1 # make sure only one letter
            puts "Error: Please guess only one letter"
            get_valid_user_input(letters_guessed)
        end
        letters_guessed.push letter
        letter
    end
end