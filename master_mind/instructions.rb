module Instructions
    def instructions
        <<~HEREDOC
            Hello, #{@player_name}.
            This is how you play Mastermind.

            It is a 1 player game against the computer.
            You can choose to make the code or to break the computer's code.
            The code breaker will have 12 guesses to crack the code. 

            There are 6 different number/color combinations:
            #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('4')}#{code_colors('5')}#{code_colors('6')}

            The code will consist of 4 number/color combinations. Example:
            #{code_colors('3')}#{code_colors('2')}#{code_colors('5')}#{code_colors('6')}

            You can use any number more than once. 

            If using the code example from above gussing "1236" would give you a clue that would say you got 
            2 in the correct spot and 1 in an incorrect spot.
            #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('6')} Clues: #{clue_markers('+')}#{clue_markers('+')}#{clue_markers('-')}

            Time to start the game.
            Do you want to make a code or break a code.

            Press '1' to be the code maker
            Press '2' to be the code breaker

        HEREDOC
    end
end