module UserPromts
    def new_load_quit_game
        <<~HEREDOC
        What would you like to do?
        New Game, Load Game, or Quit?
        HEREDOC
    end

    def play_again
    <<~HEREDOC
        Do you want to play again? Y for Yes. Anything else will quit the game.
        HEREDOC
    end
end