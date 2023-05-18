def substrings(phrase, dictionary)
  result = {}

  dictionary.each do |word|
    result[word] = phrase.downcase.scan(word).count
  end

  result.delete_if {|k, v| v == 0}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)