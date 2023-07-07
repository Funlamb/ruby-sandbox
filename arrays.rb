str_array = ["Hello,", "I'm", "hungry"]

for i in str_array
    print "#{i} "
end
puts str_array[0] # accessing the array
puts str_array.first(2)

# pushing and popping an array
num_array = [1,2,3,4,5]
print "\n"
print "First print: ", num_array
# add to an array
num_array.push(6, 10)
print num_array
print "\nPop:" + num_array.pop.to_s
print num_array