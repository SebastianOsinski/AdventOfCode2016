
input = File.read("day3_input")

lines = input.split("\n").map { |line| line.split(" ").map { |e| e.to_i  } }

def is_valid_triangle(sides)
  sides[0] + sides[1] > sides[2] &&
  sides[1] + sides[2] > sides[0] &&
  sides[0] + sides[2] > sides[1]
end

validCount = lines.inject(0) { |sum, sides| sum + (is_valid_triangle(sides) ? 1 : 0) }

puts validCount

