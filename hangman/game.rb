require 'set'
require 'yaml'
require 'find'

class Game
    attr_reader :word_to_guess, :remaining_guesses, :letters_guessed

    def initialize()
        @word_to_guess = get_random_word
        @remaining_guesses = 10
        @letters_guessed = Set[]
    end

    def load_game()
        # get a name of all the files
        files = []
        Find.find('.') do |path|
            files << path if path =~ /.*\.hm$/
        end
        # show the trimmed file names to the user
        puts files.map {_1.delete_suffix(".hm").delete_prefix("./")}
        puts "What file would you like to load?"
        file_to_load = gets.chomp
        file_to_load = file_to_load.gsub("\.hm", "") # Remove .hm incase player added it
        if (File.exist?("#{file_to_load}.hm"))
            file = File.open("#{file_to_load}.hm")
            load_yaml(file)
            core_game
        else 
            puts "File does not exist!"
        end
    end

    def load_yaml(string)
        data = YAML.load string
        @word_to_guess = data[:word_to_guess]
        @remaining_guesses = data[:remaining_guesses]
        @letters_guessed = data[:letters_guessed]
    end

    def save_game(word_to_guess, remaining_guesses, letters_guessed)
        puts "What do you want to name your save file?"
        save_file_name = gets.chomp
        save_file = YAML.dump ({
            :word_to_guess => @word_to_guess,
            :remaining_guesses => @remaining_guesses,
            :letters_guessed => @letters_guessed
        })
        begin
            file = File.open("#{save_file_name}.hm", "w")
            file.write(save_file)
            file.close
        rescue
            "Failed to save. Please contact your administrator."
        end
        puts "Save Game"
    end
    
    def start_game
        @word_to_guess = get_random_word
        @remaining_guesses = 10
        @letters_guessed = []
        core_game
    end

    def core_game
        # show the player correct letters
        still_playing = true
        while @remaining_guesses > 0 && still_playing
            puts "You have #{remaining_guesses} wrong guesses before you loose the game."
            puts "Your word to guess: " + word_with_blanks(letters_guessed, word_to_guess)
            puts "What letter would you like to try? ('save' to save your game, or 'exit' to exit without saving)"
            is_user_input_valid = false
            until is_user_input_valid
                user_input = gets.chomp.downcase
                if user_input == 'save'
                    save_game(word_to_guess, remaining_guesses, letters_guessed)
                    is_user_input_valid = true
                    still_playing = false
                elsif user_input == 'exit'
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
            # puts "\e[H\e[2J"
            # win condition
            # lose condition
        end
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
end