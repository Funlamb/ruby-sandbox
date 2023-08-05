module Formating
    def code_colors(number)
        {
            '1' => "\e[101m  1  \e[0m ",
            '2' => "\e[43m  2  \e[0m ",
            '3' => "\e[44m  3  \e[0m ",
            '4' => "\e[45m  4  \e[0m ",
            '5' => "\e[46m  5  \e[0m ",
            '6' => "\e[41m  6  \e[0m ",
        }[number]
    end

    def clue_markers(clue)
        {
            '+' => "\e[91m\u25CF\e[0m",
            '-' => "\e[37m\u25CB\e[0m"
        }[clue]
    end

    def show_code(code)
        code.each do |elm|
            print code_colors(elm)
        end
    end

    def show_clues(exact_spot, same_color)
        print 'Clues: '
        exact_spot.times {print clue_markers('+')}
        same_color.times {print clue_markers('-')}
        puts ''
    end

    def display_human_first_move
        puts "Please make your first guess."
        print "Example: "
        show_code("2354".chars)
    end

    def display_human_feedback(guess, clues, turns)
        show_code(guess)
        show_clues(clues[0], clues[1])
        if turns > 1
            puts "You have #{turns} turns left."
        elsif turns == 1
            puts "This is your last turn. Think carefully."
        end
    end

    def display_human_victory(guess, turns)
        show_code(guess)
        puts " is the correct code."
        turns = 12 - turns
        puts "You cracked the code in #{turns} turns."
    end

    def display_human_loss (password)
        puts "Sorry the correct code was: "
        show_code(password.chars)
    end

    def display_computer_feedback(guess, clues, turns)
        show_code(guess)
        show_clues(clues[0], clues[1])
        if turns == 1
            puts "This is the computers last turn. Hope they fail."
        else
            puts "Computer has #{turns} turns left."
        end
    end

    def display_computer_victory(guess, turns)
        show_code(guess)
        show_clues(4,0)
        print "The computer figured out your code of "
        show_code(guess)
        turns = 12 - turns
        print " in #{turns} turns."
    end
end