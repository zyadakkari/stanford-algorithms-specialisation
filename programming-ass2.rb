require 'pry-byebug'

file = File.open("100k-numbers.rtf")
file_data = file.readlines.map(&:chomp)
file_data.shift(9)
file_data.map! { |i| i = i[0..-2].to_i}
file_data.unshift(54044)
file_data.delete_at(1)
file_data.pop


x = [1,5,2, 8,3,4]
@count = 0

def rec_inversion(x)
# binding.pry
  if x.length < 2
    return x
  else
    half = x.length/2
    left = rec_inversion(x[0..half-1])
    right = rec_inversion(x[half..])
    results = split_inversion(left, right)
  end
end

def split_inversion(l, r, count=0, merged=[])
# binding.pry
  while l.length > 0 && r.length > 0
    if l[0] <= r[0]
      merged << l.shift
    else
      merged << r.shift
      @count += l.length
    end
  end
  merged << l
  merged << r
  merged = merged.compact.flatten
  p @count
  return merged
end

rec_inversion(file_data)
