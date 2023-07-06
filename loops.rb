#making a range from 1 to 5 inclusive
mike = (1..5)
for i in mike
    puts "#{i} zombies incoming"
end

#making a range from 1 to 5 exclusive
mike = (1...5) #notice the extra period
for i in mike
    puts "#{i} zombies incoming"
end

# while loops
i = 0
while i < 10 do
    print "#{i} "
    i += 1
end

# do while answer is not yes
puts "Whill you marry me?"
while gets.chomp != "yes" do
    puts "Will you marry me?"
end

# or do until the answer is yes
puts "Are you sure?"
until gets.chomp == "yes" do
    puts "Are you sure?"
end

#upto and downto loops
print "upto loop: "
5.upto(10) {|n| print "#{n} "}
print "downto loop: "
10.downto(5) {|n| print "#{n} "}