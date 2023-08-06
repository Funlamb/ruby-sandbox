# Read a file
file = File.open("users.txt")
file_data = file.read
print file_data
file.close

# Write to a file
file = File.open("write.txt", "w") # The w in the second argument means you will rewrite to this file
file.write("#{Time.now} - user logged in.\n") 
file.close

# Append to a file
file = File.open("write.txt", "a") # a for append to a file
file.write("#{Time.now} - user logged in.\n") 
file.close

