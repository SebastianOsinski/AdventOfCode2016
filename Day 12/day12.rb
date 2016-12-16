require_relative 'computer'

input = File.read('day12_input')

computer = Computer.new

computer.set_register('c', 1)
computer.run_program(input)

puts computer.get_register('a')