class Sub_string
    def substring (words, dictionary)
        overlap = {}
        words_split = words.downcase.gsub(/[^a-z0-9\s]/i, '').split(" ")
        dictionary.each do |word|
            words_split.each do |check_word|
                if check_word.include?word
                    if !overlap.key?(:"#{word}")
                        overlap[:"#{word}"] = 1
                    else
                        temp = overlap[:"#{word}"]
                        overlap[:"#{word}"] = temp + 1
                    end
                end
            end
        end
        overlap
    end
end

dict = ["below","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word = "belo"

thingy = Sub_string.new
puts thingy.substring(word, dict)
many_words = "Howdy partner, sit down! How's it going?"
puts thingy.substring(many_words, dict)
