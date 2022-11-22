file = File.open("./jobs.txt")
file_data = file.readlines.map(&:chomp)
file_data.shift
file_data.map! do |job|
    job = job.split(" ").to_a
    job[0] = job[0].to_i
    job[1] = job[1].to_i
    job << (job[0] - job[1])

end

file_data = file_data.sort_by { |elem| [elem[2], elem[0]] }.reverse!
sum = 0
comptime = 0

file_data.each do |job|
    sum += job[1]
    comptime += sum * job[0]
end
p comptime
