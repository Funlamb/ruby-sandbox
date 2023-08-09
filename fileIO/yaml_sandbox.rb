require 'yaml'
require_relative 'person.rb'

p = Person.new("Mike", 40, "Male")
p p.to_yaml

another_person = Person.from_yaml(p.to_yaml)
puts "Name #{another_person.name}"
puts "Age #{another_person.age}"
puts "Gender #{another_person.gender}"