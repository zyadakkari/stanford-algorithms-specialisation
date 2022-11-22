old_stdout = $stdout
File.open('scc-results.txt', 'w') do |fo|
  $stdout = fo

  puts "hello"

end
$stdout = old_stdout
