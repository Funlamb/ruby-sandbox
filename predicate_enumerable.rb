# create an array
numbers = [5, 6, 7, 9, 10, 3]
# check is a number exists
puts numbers.include?(6)
puts numbers.include?(4)

# check with a conditional
puts numbers.any? { |num| num > 4}
puts numbers.any? { |num| num < 3}

# check if all numbers are a  greater than 6
puts numbers.all? {|num| num > 6}

# check if all numbers are 6
puts numbers.all? { |num| num == 6}