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

# player gets 10 wrong guesses
remaining_guesses = 10
puts "You have #{remaining_guesses} wrong guesses before you loose the game."
# show that player the word with blanks
letters_used = []
def word_with_blanks(regexp)
    word_to_guess = 'helpme'
    letters = regexp.join
    puts letters
    unless letters.empty?
        regexp = Regexp.new("[^#{letters}]")
        return word_to_guess.gsub(regexp, '_').chars.join(' ')
    end
    return '_ ' * word_to_guess.length 
end
word_for_palyer = word_with_blanks(letters_used)
# show the player correct letters
while remaining_guesses > 0
    puts "Your word to guess: " + word_with_blanks(letters_used)
    puts "What letter would you like to try? "
    letter = gets.chomp
    letters_used.push letter
    remaining_guesses -= 1
    print letters_used
    puts ''
    word_for_palyer = word_with_blanks(letters_used)

    # check if letter is good
    # show word if letter is good
    # maybe use gsub with the letters already chosen?
end
# show player wrong letters used
# clear cmd every input so game stays up top

# win condition
# lose condition
