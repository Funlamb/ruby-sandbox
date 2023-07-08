my_hash = Hash.new
puts my_hash
# add to the hash
my_hash["Name"] = "Mike"
my_hash["School"] = "Junior College"
my_hash["Love"] = "Blind"
puts my_hash
# print one hash item
puts my_hash["Name"]

# deleting an item will also return it
puts my_hash.delete("Love")
puts my_hash

# using symbols to create hashes
# rocket style
my_rocket_hash = {
    :car => "Ford",
    :age => "noneya",
    :hobby => "coding"
}
# simplier syntax
my_symbol_hash = {
    car: "Ford",
    age: "noneya",
    hobby: "coding"
}

puts my_rocket_hash
puts my_symbol_hash
# Hashes still must be accessed through the standard symbol syntax
puts my_rocket_hash[:car]
puts my_symbol_hash[:car]