require_relative 'disc_set'

input = File.read('day15_input')

discs = input.split("\n").map do |line|
  pattern = /Disc #\d has (\d+) positions; at time=0, it is at position (\d+)\./

  positions_count, starting_position = line.match(pattern).captures

  Disc.new(positions_count.to_i, starting_position.to_i)
end

disc_set = DiscSet.new(discs)

t = 0

until disc_set.can_go_through?(t) do t += 1 end

puts t
