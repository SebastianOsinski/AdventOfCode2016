require_relative 'screen'
require_relative 'operations_parser'

input = File.read('day8_input')
parser = OperationsParser.new
operations = parser.parse(input)

screen = Screen.new(50, 6)

operations.each do |operation|
  first = operation.first_argument
  second = operation.second_argument
  screen.send(operation.type, first, second)
  puts screen
  puts "\n"
end

puts screen.lit_pixels_count







