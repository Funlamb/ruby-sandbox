require 'pry-byebug'

def isogram?(string)
    original_length = string.length
    string_array = string.downcase.split('')
    unique_length = string_array.uniq.length
    p original_length
    p unique_length
    original_length == unique_length
    binding.pry
  end
  
puts isogram?("Odin")
  
# to use the debugger you need to add 'require 'pry-byebug''
# and add 'binding.pry' where you want to be able to inspect your code