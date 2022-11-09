require 'pry-byebug'

file = File.open("./prob-2sum.txt")
file_data = file.readlines.map(&:chomp)
file_data.map! { |n| n.to_i }


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]


def two_sum(data, hash, num)
  data.each do |elem|
      # binding.pry
    complement = num - elem
    if hash.has_key?(complement) && complement != elem
      @complement_exist << num
      return
    end
  end
end

def prog_ass_function(data)
  two_sum_hash = Hash[data.collect.with_index { |v, idx| [v, idx]}]
  @complement_exist = []
  for num in (-10000..10000)
      p num
      two_sum(data, two_sum_hash, num)
  end
  p @complement_exist.length
end




prog_ass(file_data)
