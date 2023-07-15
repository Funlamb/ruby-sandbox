class Sub_string
    def substring (words, dictionary)
        overlap = {}
        dictionary.each do |word|
            if (word == words)
                if !overlap.key?(:"#{word}")
                    overlap[:"#{word}"] = 1
                else
                    temp = overlap[:"#{word}"]
                    overlap[:"#{word}"] = temp + 1
                end
            end
        end
        overlap
    end
end

dict = ["below","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
word = "below"

thingy = Sub_string.new
puts thingy.substring(word, dict)