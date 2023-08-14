# Download the google words
# Find words that are 5 to 12 letters long
unless File.exist?('google-10000-words-between-5-12.txt')
    filtered_words = []
    filtered_words = File.foreach('google-10000-words.txt', chomp: true).select {
        _1.length.between?(5,12) }
    
    File.open('google-10000-words-between-5-12.txt', 'w') { _1.puts *filtered_words}
end

# load the words

# player gets 10 wrong guesses
# show that player the word with blanks
# show the player correct letters
# show player wrong letters used
# clear cmd every input so game stays up top

# win condition
# lose condition
