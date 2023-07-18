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

    def to_s
        "I'm #{@name} with #{@score.to_s} as my score"
    end
end