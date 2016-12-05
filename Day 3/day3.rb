def is_valid_triangle(sides)
  sides[0] + sides[1] > sides[2] &&
  sides[1] + sides[2] > sides[0] &&
  sides[0] + sides[2] > sides[1]
end

input = File.read("day3_input")

#first part
lines = input.split("\n").map { |line| line.split(" ").map { |e| e.to_i  } }

#second part

sides = lines.flatten

aSides = sides.select.with_index { |e, i| [0, 1, 2].include?(i % 9) }
bSides = sides.select.with_index { |e, i| [3, 4, 5].include?(i % 9) }
cSides = sides.select.with_index { |e, i| [6, 7, 8].include?(i % 9) }

lines = aSides.zip(bSides, cSides)

validCount = lines.inject(0) { |sum, sides| sum + (is_valid_triangle(sides) ? 1 : 0) }

puts validCount

