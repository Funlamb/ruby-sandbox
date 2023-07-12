puts "create an array"
friends = ["Sharon", "Leo", "Laya", "Dave", "Rob"]
print friends

puts "\nyou can use select and reject to iterate trhough the array"
puts friends.select {|friend| friend!= "Rob"}
puts friends.reject {|fri| fri == "Rob"}

puts "\nfor singel line statments "
friends.each {|friend| puts "Hello, " + friend.upcase + "!"}

puts "\nwhen you need multi line statements use do end syntax"
friends.each do |x|
    puts x
end

puts "\nWith hashes"
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }
my_hash.each { |pair| puts "the pair is #{pair}" }

puts "\nTo change the original array"
friends.map {|f| f.upcase}
puts friends

# This did not change the original array
friendss = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
friendss.map { |friend| friend.upcase }
puts friendss