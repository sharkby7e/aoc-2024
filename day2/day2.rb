safe_count = 0

lines = File.readlines("./day2.txt").each.map do |line|
  line.split(" ").map {|e| e.to_i}
end

def all_decreasing(arr)
  arr.each_with_index do |x, i|
    if i+1 < arr.length
      return false if x >= arr[i+1]
    end
  end
  true
end

def all_increasing(arr)
  arr.each_with_index do |x, i|
    if i+1 < arr.length
      return false if x <= arr[i+1]
    end
  end
  true
end

def diff_less_3(arr)
  arr.each_with_index do |x, i|
    if i+1 < arr.length
      return false if (x - arr[i+1]).abs > 3
    end
  end
  true
end

def truly_safe(arr)
  (all_decreasing(arr) || all_increasing(arr)) && diff_less_3(arr)
end

def dampened_safe(arr)
  arr.each_with_index do |level, i|
    copy = arr.dup
    copy.delete_at(i)
    return true if truly_safe(copy)
  end
  false
end

lines.each do |line|
  safe_count += 1 if truly_safe(line) || dampened_safe(line)
end


p safe_count
