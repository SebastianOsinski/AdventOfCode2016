class Move
  attr_accessor :direction
  attr_accessor :steps

  def initialize(move)
    @direction = if move[0] == "L" then :left else :right end
    @steps = move[1..-1].to_i
  end

  def to_s
    "#{@direction} #{@steps}"
  end
end

input = File.read("day1_input")

directions = [:north, :east, :south, :west]

moves = input.split(", ").map { |x| Move.new x}
puts moves

counts = Hash.new 0

current_direction_index = 0 # north

moves.each do |move|
  case move.direction
  when :left
    current_direction_index = (current_direction_index - 1) % 4
  when :right
    current_direction_index = (current_direction_index + 1) % 4
  end

  counts[directions[current_direction_index]] += move.steps
end

puts (counts[:north] - counts[:south]).abs + (counts[:west] - counts[:east]).abs
