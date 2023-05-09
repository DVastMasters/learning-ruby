phrase = "Learning Ruby" 
puts phrase.length()
puts phrase.downcase() 
puts phrase.upcase()

phrase = "     Learning Ruby     " 
puts phrase.strip()

phrase = "Learning Ruby" 
puts phrase.include? "Ruby"
puts phrase[0]
puts phrase[9, 4]
puts phrase.index("R")
puts phrase.index("Ruby")
