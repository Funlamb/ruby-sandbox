require_relative 'user_promts.rb'
require_relative 'game.rb'

class Main
    include UserPromts

    def start
        play_game = 'y'
        until play_game != 'y' do
            puts new_load_quit_game
            game_choice = get_valid_user_choice
            new_game if game_choice == 'n'
            load_game if game_choice == 'l'
            puts play_again
            # ask user if they want to play again
            play_game = gets.chomp.downcase
        end
    end
end

def get_valid_user_choice
    choice = gets.chomp.downcase
    if (choice == 'n' || choice == 'new')
        puts "Start a new game"
        'n'
    elsif (choice == 'l' || choice == 'load')
        puts "Load an old game"
        'l'
    else
        puts "Invalid choice. Please choose New Game, or Load Game"
        get_valid_user_choice
    end
end

def new_game
    game = Game.new
    game.start_game
end

def load_game
    game = Game.new
    game.load_game
end

main = Main.new
main.start