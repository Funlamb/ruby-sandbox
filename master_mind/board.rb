class Board
    # make a random password out of 6 colors/numbers
    def initialize ()
        @password = make_password()
    end

    def get_password()
        @password
    end

    def make_password ()
        password = ""
        4.times do 
            n = 1 + Random.rand(6) # get random number from 1 to 6
            password += n.to_s # used a string for ease of use
        end
        password
    end
end