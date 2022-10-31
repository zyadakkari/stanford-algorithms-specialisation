require 'pry-byebug'

file = File.open("quicksort-numbers.rtf")
file_data = file.readlines.map(&:chomp)
file_data.shift(9)
file_data[0] = "2148\\"
file_data.map! { |i| i = i[0..-2].to_i}

# quick sort with first element as pivot: correct answer 162085
# n = [3, 1, 5, 4, 2]
#
# @comparisons = 0
#
# def quicksort(n)
#   if n.length < 2
#     return n
#   else
#     p = n[0]
#     i = 1
#     for j in (1..n.length-1)
#             # binding.pry
#       if n[j] < p
#         lowest = n[i]
#         n[i] = n[j]
#         n[j] = lowest
#         i += 1
#       end
#     end
#     n[0] = n[i-1]
#     n[i-1] = p
#     @comparisons += n.length-1
#     i-2 >= 0 ? left = quicksort(n[0..i-2]) : left = []
#     right = quicksort(n[i..])
#     n = [left, p, right].flatten
#   end
#   return n
# end
#
# p quicksort(file_data)
# p @comparisons


# quicksort with last element as pivot: correct answer 164123
# n = [3, 1, 5, 9, 7, 4, 2]
#
# @comparisons = 0
#
# def quicksort(n)
#   if n.length < 2
#     return n
#   else
#     p = n[-1]
#     n[-1] = n[0]
#     n[0] = p
#     i = 1
#     for j in (1..n.length-1)
#             # binding.pry
#       if n[j] < p
#         lowest = n[i]
#         n[i] = n[j]
#         n[j] = lowest
#         i += 1
#       end
#     end
#     n[0] = n[i-1]
#     n[i-1] = p
#     @comparisons += n.length-1
#     i-2 >= 0 ? left = quicksort(n[0..i-2]) : left = []
#     right = quicksort(n[i..])
#     n = [left, p, right].flatten
#   end
#   return n
# end
#
# p quicksort(file_data)
# p @comparisons

# quick sort with median of three as pivot

n = [3, 1, 5, 4, 9, 2, 7, 6]

@comparisons = 0

def quicksort(n)
  if n.length < 2
    return n
  else
    p = median_of_three(n)
    pindex = n.find_index(p)
    n[pindex] = n[0]
    n[0] = p
    i = 1
    for j in (1..n.length-1)
                # binding.pry
      if n[j] < p
        lowest = n[i]
        n[i] = n[j]
        n[j] = lowest
        i += 1
      end
    end
    n[0] = n[i-1]
    n[i-1] = p
    @comparisons += n.length-1
    i-2 >= 0 ? left = quicksort(n[0..i-2]) : left = []
    right = quicksort(n[i..])
    n = [left, p, right].flatten
  end
  return n
end

def median_of_three(arr, array=[])
  if arr.length < 3
    return arr[0]
  else
    array << start = arr[0]
    array << last = arr[-1]
    arr.length.even? ? array << mid = arr[(arr.length-1)/2] : array << arr[arr.length/2]
    array = array.sort
    return array[1]
  end
end




p quicksort(file_data)
p @comparisons
