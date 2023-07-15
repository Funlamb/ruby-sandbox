class Caeser_cipher
    def cipher(string_to_change, int_bump)
        int_bump = int_bump % 25
        new_str = ""
        # get a char
        string_to_change.each_char do |letter|
            # 65 to 90 uppercase 25 diff
            if (letter.ord >= 65 && letter.ord <= 90)
                temp_char = letter.ord - int_bump
                if (temp_char < 65)
                    temp_char += 25
                end
                new_str += temp_char.chr
            elsif (letter.ord >= 97 && letter.ord <= 122)
            # 97 to 122 lowercase
                temp_char = letter.ord - int_bump
                if (temp_char < 97)
                    temp_char += 25
                end
                new_str += temp_char.chr
            else 
                temp_char = letter
                new_str += temp_char.chr
            end
        end
        # return the string
        new_str
    end
end
# puts Caeser_cipher.cipher("Hello", 5)