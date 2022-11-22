require 'pry-byebug'

file = File.open("./prims_edges.txt")
file_data = file.readlines.map(&:chomp)
file_data.shift
file_data.map! do |edge|
    edge = edge.split(" ")
    edge.map! { |e| e.to_i}
end

@unvisited = []
@visited = []
@totalCost = 0

@visited << 1
while @visited.length != 500

    # @visited << nextEdg
    p @visited.length
    relevantEdges = file_data.each_index.select { |i| @visited.include?(file_data[i][0]) || @visited.include?(file_data[i][1]) }
    edLen = 1000000
    nextEdg = file_data[relevantEdges[0]][1]
    for e in relevantEdges
        # binding.pry
        if file_data[e][2] < edLen && (!@visited.include?(file_data[e][1]) || !@visited.include?(file_data[e][0]))
            edLen = file_data[e][2]
            if !@visited.include?(file_data[e][0])
                nextEdg = file_data[e][0]
            else
                nextEdg = file_data[e][1]
            end
                origin = file_data[e][0]
        end
    end
    p nextEdg
    p edLen
    @totalCost += edLen
    @visited << nextEdg
end


p @totalCost
