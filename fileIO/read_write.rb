# Read a file
file = File.open("users.txt")
file_data = file.read
print file_data
puts ''
file.close

# Write to a file
file = File.open("write.txt", "w") # The w in the second argument means you will rewrite to this file
file.write("#{Time.now} - user logged in.\n") 
file.close

# Append to a file
file = File.open("write.txt", "a") # a for append to a file
file.write("#{Time.now} - user logged in.\n") 
file.close

# Read the position of the file
file_data = []
File.foreach("users.txt") do |line| 
    puts line
    file_data.push(line)
end

# Writing to a file moves the cursor. To read from that file again you must go back to the top
fd = File.open("cursor.txt", "w")
fd.puts 'Hello World'
fd.puts 'goodbye world'
puts fd.gets
puts fd.pos
puts fd.eof?