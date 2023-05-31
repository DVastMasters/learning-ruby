puts File.exists?("hamlet.txt")
puts File.exists?("data-files")

puts Dir.glob("/home/").length
puts '------------------------'
puts Dir.glob("*").join(",\n")
puts '------------------------'
Dir.glob("*").sort_by{ |fname| File.size(fname) }.reverse[0..9].each do |fname|
  puts "#{fname}\t#{File.size(fname)}"
end
puts '------------------------'
Dir.glob("*").group_by{ |fname| File.extname(fname) }.each do |ext, files|
  puts "#{ext.upcase}\t#{files.size}\t#{files.reduce(0) {|count, file| count += File.size(file)} }"
end