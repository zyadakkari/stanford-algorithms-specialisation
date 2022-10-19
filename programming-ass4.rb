require 'pry-byebug'

file = File.open("./kargerMinCut.rtf")
file_data = file.readlines.map(&:chomp)
file_data.shift(9)
file_data[0] = file_data[0][30..]
# puts file_data
nodeHash = Hash.new()

# file clean for copy
# file = File.open("./kargerMinCut copy.rtf")
# file_data = file.readlines.map(&:chomp)
# file_data.shift(9)
# file_data[0] = file_data[0]


nodeHash = Hash.new()


for string in file_data
    splitArray = string.split
    splitArray.pop
    nodeHash[splitArray[0]] = splitArray[1..]
end
nodeHash.delete(nil)

numberOfEdges = 0
numberOfNodes = nodeHash.size
@count = 0

nodeHash.each  { |k, v| numberOfEdges += v.length }


def karger_min_cut(hashgraph)
  while hashgraph.keys.length > 2
      # binding.pry
    # picks edge to contract
    node1 = hashgraph.keys.sample
    node2 = hashgraph[node1].sample
    comboNode = "#{node1}, #{node2}"
    # cuts self link between newly combined nodes
    hashgraph[node1].delete(node2)
    # issue here, node2 doesn't exist at some point
    hashgraph[node2].delete(node1)

    # combines the connections of the two nodes
    hashgraph[node1] << hashgraph[node2]
    hashgraph[node1] = hashgraph[node1].flatten
    # deletes the two old nodes creating one combined node
    hashgraph.delete(node2)
    hashgraph[comboNode] = hashgraph.delete(node1)
    # replaces all instances of the old nodes with the combined node
    hashgraph = hashgraph.each do |k, v|
      while v.include?(node1)
        index = v.find_index(node1)
        v[index] = comboNode
      end
      while v.include?(node2)
        index = v.find_index(node2)
        v[index] = comboNode
      end
    end
  end
  puts hashgraph.values[0].length
end

karger_min_cut(nodeHash)
