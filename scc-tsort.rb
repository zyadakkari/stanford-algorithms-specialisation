require 'pry-byebug'
require 'tsort'

file = File.open("./SCC.txt")
file_data = file.readlines.map(&:chomp)

file_data.map! { |edge| edge.split }

rev_file_data = file_data.map { |edge| edge  = edge.reverse() }

@graphHash = Hash[
      file_data.group_by(&:first).collect do |key, values|
        [ key, values.collect { |v| v[1] }]
      end
    ]

values = @graphHash.values.flatten.uniq
for v in values
  if !@graphHash.has_key?(v)
      @graphHash[v] = []
  end
end
p @graphHash.keys.size

# class G
#       include TSort
#       def initialize(g)
#         @g = g
#       end
#       def tsort_each_child(n, &b) @g[n].each(&b) end
#       def tsort_each_node(&b) @g.each_key(&b) end
# end
#
# graph = G.new(@graphHash)
# p graph.tsort

# class Hash
#     include TSort
#     alias tsort_each_node each_key
#     def tsort_each_child(node, &block)
#       fetch(node).each(&block)
#     end
# end
#


# old_stdout = $stdout
# File.open('scc-results.txt', 'w') do |fo|
#   $stdout = fo
#
#   p @graphHash.strongly_connected_components
#
# end
# $stdout = old_stdout
