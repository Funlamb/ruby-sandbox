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

arr = [1, 2, 3]
arr2 = [2, 2]
def arry_check(array)
    result = case array
        in [a, b, *] unless a == b
        return :good
    else 
        return :no_good
    end
end
puts "Check if array [1, 2] are an array and have don't have the same numbers: " + arry_check(arr).to_s
puts "Check if array [2, 2] are an array and have don't have the same numbers: " + arry_check(arr2).to_s

hash = {a: 'apple', b: 'banana'}
result = case hash
    in {a: 'apple', b: 'banana'}
    :good
    in {a: 'apple', b: 'bat'}
    :no_good
end
puts "Checking a hash {a: 'apple', b: 'banana'} " + result.to_s

hash = [1, 2, "a", 3, 4, "b", "c", 5, 6, 7]
result = case hash
    in [*pre, String => x, String =>z, *post]
    [pre, x, z, post]
end
print "Print the sepperated array: " + result[0].to_s + " " + result[1].to_s + " " + result[2].to_s + " " + result[3].to_s + "\n"

data = [
    {name: "John", age: 59, first_language: 'english', job_title: 'CEO'},
    {name: "Moyra", age: 53, first_language: 'french', job_title: 'actress'},
    {name: "David", age: 32, first_language: 'english', job_title: 'Owner'},
    {name: "Alexis", age: 29, first_language: 'english', job_title: 'Public Relations'},
    {name: "Patric", age: 34, first_language: 'english', job_title: 'Co-Owner'},
]
name = "Alexis"
age = 29
job_title = "Public Relations"
result = case data
    in [*, {name: ^name, age: ^age, first_language: first_language, job_title: ^job_title}, *]
    first_language
    else
        first_language = nil
end
puts "The first language of #{name} is #{first_language}."