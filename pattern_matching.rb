# Pattern matching using 'in'
grade = 'C' 
result = case grade
    in 'A' then 1
    in 'B' then 2
    in 'C' then 3
    in 'D' then 4
    else 0
end
puts result

login = {username: 'hornby', password: 'heckle'}
login => {username: username}
puts "Logged in as #{username}"

a = 5
result = case a
    in 1 then 1
    in 2 then 2
    in 3 then 3
    in 4 then 4
    in 5 then 5
end
puts result

# Match an array
arr = [1 ,2]
result = case arr
    in [1, 2] then :match
    in [3, 4] then :no_match
end
puts result

# Match to types
arr = [1,2]
result = case arr
    in [Integer, Integer]
    :match
    in [String, String]
    :no_match
end
puts result

arr = [1, 2, 3]
result = case arr
    in [Integer, Integer] then :match
else :no_match
end
puts "Testing array [1,2,3] in [Integer, Integer] = #{result}"

arr = [1, 2, 3]
result = case arr
    in [Integer, Integer, *] then :match
else :no_match
end
puts "Testing array [1,2,3] in [Integer, Integer, *] = #{result}"

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = case arr
    in [Integer, *, Integer] then :match
else :no_match
end
puts "Match array with any number of args [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] in [Integer, *, Integer] = #{result}"

arr = [1, 2, 3, 4, 5]
result = case arr
    in [1, 2, *tail]
    tail
end
print "Print the rest of array [1, 2, 3, 4, 5] in [1, 2, *tail]" + result.to_s + "\n"

arr = [1, 2, 3, 4]
result = case arr
    in [_, _, 3, 4] then :match
end
puts "Not caring about the first two items [1, 2, 3, 4] in [_, _, 3, 4] = #{result}"