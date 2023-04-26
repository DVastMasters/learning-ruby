puts "READING - 1"

File.open("employees.txt", "r") do |file|
    #puts file.read().include? "Jim"

    #puts file.readline()
    #puts file.readchar()
    
    for line in file.readlines()
        puts line
    end
end 

puts "READING - 2"
file = File.open("employees.txt", "r")

puts file.read
file.close

#Truncate file
#File.open("employees.txt", "w") do |file|
#    file.write("\nOscar, Accounting")
#end

#Create file
File.open("index.html", "w") do |file|
    file.write("<h1>Teste</h1>")
end

File.open("employees.txt", "r+") do |file|
    file.readline()
    file.write("Hi")
end