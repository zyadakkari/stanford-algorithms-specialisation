require 'pry-byebug'
require 'rb_heap'

file = File.open("./Median_list.txt")
file_data = file.readlines.map(&:chomp)
file_data.map! { |n| n.to_i }




def median_maintenance(data)
  medians = []
  h_low = Heap.new(:>)
  h_high = Heap.new(:<)
  h_low.add(data[0])
  medians << data[0]
  for i in data[1..]
    i < h_low.peak ? h_low.add(i) : h_high.add(i)
    if h_low.size - h_high.size > 1
      change = h_low.pop
      h_high.add(change)
    elsif h_high.size - h_low.size > 1
      change = h_high.pop
      h_low.add(change)
    end
    median_element = h_high.size + h_low.size
    median_element.even? ? median_pos = median_element/2 : median_pos = (median_element+1)/2
    h_low.size == median_pos ? medians << h_low.peak : medians << h_high.peak
  end
  medians_total = medians.sum
  # puts medians_total % 10000
  # puts medians
end


median_maintenance(file_data)
