require 'set'

class Game
    attr_reader :word_to_guess, :remaining_guesses, :letters_guessed

    def initialize()
        @word_to_guess = get_random_word
        @remaining_guesses = 10
        @letters_guessed = Set[]
    end

    def load_game(game_to_load)
        # TODO Load Game
        puts "TODO: Load Game"
    end

    def save_game(word_to_guess, remaining_guesses, letters_guessed)
        # TODO Save game
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
        still_playing = true
        while @remaining_guesses > 0 && still_playing
            puts "You have #{remaining_guesses} wrong guesses before you loose the game."
            puts "Your word to guess: " + word_with_blanks(letters_guessed, word_to_guess)
            puts "What letter would you like to try? (or 'save' to save your game)"
            is_user_input_valid = false
            until is_user_input_valid
                user_input = gets.chomp.downcase
                if user_input == 'save'
                    save_game(word_to_guess, remaining_guesses, letters_guessed)
                    is_user_input_valid = true
                    still_playing = false
                elsif user_input.length == 1
                    if letters_guessed.include?(user_input) # make sure letter is not already used
                        puts "Error: #{user_input} already used. Please pick again"
                    else
                        letters_guessed.push user_input
                        is_user_input_valid = true
                    end
                else
                    puts "Invalid input. Please chose 1 unused letter or 'save'."
                end
                # if the letter exist don't remove a guess
                unless word_to_guess.include?(user_input)
                    @remaining_guesses -= 1
                end
            end
            puts "\e[H\e[2J"
        end
        # win condition
        # lose condition
    end

    # Download the 'google-10000-words.txt' text and filter it for words that are 5-12 in length
    # create a new file with the filtered list so you don't have to filter it again
    def get_random_word
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
    
    # TODO fix save and user letter
    def get_valid_user_input(letters_guessed)
        if letters_guessed.include?(letter) # make sure letter is not already used
            puts "Error: #{letter} already used. Please pick again"
        end
        @letters_guessed.push letter
        letter
    end
end