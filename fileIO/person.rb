class Person
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def to_yaml
        YAML.dump ({
            :name => @name,
            :age => @age,
            :gender => @gender
        })
    end

    def self.from_yaml(string)
        p string
        data = YAML.load string
        p data
        self.new(data[:name], data[:age], data[:gender])
    end
end