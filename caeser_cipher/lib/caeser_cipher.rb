def caeser_ciper(string_to_change, int_bump)
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
        end
        # 97 to 122 lowercase
        if (letter.ord >= 97 && letter.ord <= 122)
            temp_char = letter.ord - int_bump
            if (temp_char < 97)
                temp_char += 25
            end
            new_str += temp_char.chr
        end
    end
    # return the string
    new_str
end
puts caeser_ciper("Hello", 5)