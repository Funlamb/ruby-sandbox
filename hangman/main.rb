# Download the google words
# Find words that are 5 to 12 letters long
if (!File.exist?('google-10000-words-between-5-12.txt'))
    filtered_words = []
    File.foreach('google-10000-words.txt', chomp: true) do |line|
        if (line.length.between?(5,12))
            filtered_words.push line
        end
    end
    file = File.open('google-10000-words-between-5-12.txt', 'w')
    filtered_words.each do |word|
        file.write(word + "\n")
    end
    file.close
end
# file = File.open('google-10000-words.txt')
# google_words = file.read
# print google_words 
# Save new lest to a file so we don't have to do that again
# Check if that file is available and use it

# load the words

# player gets 10 wrong guesses
# show that player the word with blanks
# show the player correct letters
# show player wrong letters used
# clear cmd every input so game stays up top

# win condition
# lose condition
