require 'pry-byebug'

file = File.open("./dijkstraData.txt")
file_data = file.readlines.map(&:chomp)
splitData = file_data.map { |node| node.split(" ")}


@dijkstra_hash_map = Hash.new()
for i in (1..200)
  @dijkstra_hash_map[i] = 1000000
end
@dijkstra_hash_map[1] = 0
graph_hash_map = Hash.new

graphNodes = []
splitData.map { |arr| graphNodes << arr.shift.to_i }
graphhashes = []

splitData = splitData.each do |arr|
    array = arr.map! do |elem|

        elem = elem.split(",")
        elem[0] = elem[0].to_i
        elem[1] = elem[1].to_i
        elem
    end
    graphhashes << array.to_h
end

for i in (0..199)
  graph_hash_map[graphNodes[i]] = graphhashes[i]
end
@count = 0
@visited = []
@unvisited = []


def dijkstra_short_path(graph, node)
  curNode = 1
  curNodeDist = 0
  while @visited.length < 200
      @visited << curNode
      for key in graph[curNode].keys
          if !@visited.include?(key)
            if (graph[curNode][key] + curNodeDist) < @dijkstra_hash_map[key]
              @dijkstra_hash_map[key] = (graph[curNode][key] + curNodeDist)
            end
          end
      end


      begin
          checkVisited = @dijkstra_hash_map.clone
          for key in checkVisited.keys
            if @visited.include?(key)
              checkVisited.delete(key)
            end
          end
          choseNode = [checkVisited.min_by{|k,v| v}].to_h
          curNode = choseNode.keys[0]
          curNodeDist = choseNode.values[0]
      rescue
          p @dijkstra_hash_map
      end
  end

end

dijkstra_short_path(graph_hash_map, 7)
