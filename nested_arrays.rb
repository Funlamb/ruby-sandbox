# incorrect way or creating a two dementional array
mutable = Array.new(3, Array.new(2))
mutable[0][0] = 100
mutable[0][1] = 200
print mutable.to_s + "\n"
# this creates an array where changing one valuse changes all off them 
# because they point to the same data

immutable = Array.new(3) {Array.new(3)}
print immutable.to_s + "\n"
immutable[0][0] = 100
immutable[0][1] = 100
immutable[1][0] = 100
immutable[2][1] = 100
print immutable.to_s + "\n"

# iteration over a nested array
immutable.each_with_index do |row, row_i|
    puts "Row:#{row_i} = #{row}"
end

# iteration over the insed of a nested array
immutable.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
        puts "Row:#{row_i} Column:#{col_i} = #{col}"
    end
end

# nested hashes
vehicles = {
    alice: {year: 2019, make: "Toyota", model: "Corolla"},
    blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
    caleb: {year: 2020, make: "Honda", model: "Accord"}
  }

puts vehicles[:alice][:year]
# Return the name of the owners that have cars newer than 2020
new_vehicles = vehicles.map { |name, data| name if data[:year] >= 2020}  
puts new_vehicles
# Return the names of the owers without nil
new_vehicles_no_nil = vehicles.collect { |name, data| name if data[:year] >= 2020}.compact
puts new_vehicles_no_nil
# Return the names of the owers without nil in a slightly different way
new_vehicles_no_nil = vehicles.filter_map { |name, data| name if data[:year] >= 2020}
puts new_vehicles_no_nil
