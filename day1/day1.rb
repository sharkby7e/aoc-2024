col1 = []
col2 = []

File.readlines("./day1.txt").each do |line|
  item1, item2 = line.split
  col1 << item1.to_i
  col2 << item2.to_i  
end

col1.sort!
col2.sort!

# part 1
# diff = col1.each_with_index.map do |x, n|
#   (x - col2[n]).abs
# end
#
# p diff.sum

col1_tallied = col1.tally
col2_tallied = col2.tally

similarity = 0

col1.each.map do |val|
  next unless col2_tallied.keys.include? val

  similarity += val * col2_tallied[val] 
end

p similarity
