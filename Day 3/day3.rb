def is_valid_triangle(sides)
  sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
end

input = File.read('day3_input')

# first part
lines = input.split("\n").map { |line| line.split(' ').map(&:to_i) }

# second part

sides = lines.flatten

a_sides = sides.select.with_index { |_e, i| [0, 1, 2].include?(i % 9) }
b_sides = sides.select.with_index { |_e, i| [3, 4, 5].include?(i % 9) }
c_sides = sides.select.with_index { |_e, i| [6, 7, 8].include?(i % 9) }

lines = a_sides.zip(b_sides, c_sides)

valid_count = lines.inject(0) { |sum, sides| sum + (is_valid_triangle(sides) ? 1 : 0) }

puts valid_count
