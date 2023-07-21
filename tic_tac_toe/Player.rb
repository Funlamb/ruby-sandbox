# score
# letter
# name
class Player
    # name = ""
    # score = 0
    # letter = ""
    def initialize(name, letter, score = 0)
        @name = name
        @letter = letter
        @score = score
    end

    def get_name
        @name
    end

    def get_letter
        @letter
    end
    
    def get_score
        @score
    end
    
    def add_point(n)
        @score += n
    end

    def to_s
        "I'm #{@name} with #{@score.to_s} as my score"
    end
end