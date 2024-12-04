string = File.read("./day3.txt")

# pt 1
# cleaned = string.scan(/mul\(\d{1,3},\d{1,3}\)/)
#
# tot = 0
# cleaned.each do |dir|
#   dir.gsub!(/mul\(/, '')
#   dir.gsub!(/\)/, '')
#
#   nums = dir.split(",")
#
#   tot += nums[0].to_i * nums[1].to_i
# end
#
# p tot

tot = 0
do_lines = string.split("do()")

do_lines.each do |ins|
  resplit = ins.split("don't()")
  cleaned = resplit[0].scan(/mul\(\d{1,3},\d{1,3}\)/)

  cleaned.each do |dir|
    dir.gsub!(/mul\(/, '')
    dir.gsub!(/\)/, '')

    nums = dir.split(",")

    tot += nums[0].to_i * nums[1].to_i
  end
end

p tot


