require 'pry-byebug'

file = File.open("./SCC.txt")
file_data = file.readlines.map(&:chomp)

file_data.map! { |edge| edge.split }

rev_file_data = file_data.map { |edge| edge  = edge.reverse() }

@graphHash = Hash[
      file_data.group_by(&:first).collect do |key, values|
        [ key, values.collect { |v| v[1] }]
      end
    ]

@revGraphHash = Hash[
    rev_file_data.group_by(&:first).collect do |key, values|
      [ key, values.collect { |v| v[1] }]
    end
]

#
# testHash = {1 => [4], 2 => [8], 3 => [6], 4 => [7], 5 => [2], 6 => [9], 7 => [1], 8 => [5, 6], 9 => [3, 7]}
# revTestHash = {4 => [1], 8 => [2], 6 => [3, 8], 7 => [4, 9], 2 => [5], 9 => [6], 1 => [7], 5 => [8], 3 => [9]}
#

@stack = []
@visited = []
@results = []
@sscs = []


def strongly_connected_components()
  for node in @graphHash.keys
    if !@visited.include?(node)
      dfs(node)
    end
    p "v #{@visited.length}"
  end
  # @visited = []
  # while !@stack.empty?
  #   @results = []
  #   if !@visited.include?(@stack[-1])
  #     rdfs(@stack[-1])
  #   end
  #   @sccs << @results.length
  #   @stack.pop
  #   p "s #{@stack.length}"
  # end
end

def dfs(node)
# binding.pry
  @visited << node
  # @results << node
  if @graphHash[node].nil?
    @stack << node
    return
  end
  for value in @graphHash[node]
    if !@visited.include?(value)
      dfs(value)
    end
  end
  @stack << node
end

def rdfs(node)
    # binding.pry
  @visited << node
  @results << node
  begin
    for value in @revGraphHash[node]
      if !@visited.include?(value)
        rdfs(value)
      end
    end
  rescue
    node
  end
end
#

strongly_connected_components()

old_stdout = $stdout
File.open('scc-results.txt', 'w') do |fo|
  $stdout = fo

  p @visited
  p @stack

end
$stdout = old_stdout
