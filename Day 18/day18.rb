require_relative 'floor_generator'

#input = '.^^.^.^^^^'
input = File.read('day18_input')

generator = FloorGenerator.new

floor = generator.generate(input, 400000)

puts floor.count('.')
