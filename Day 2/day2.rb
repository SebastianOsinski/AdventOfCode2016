require_relative 'Keypad'

keypad = Keypad.new

input = File.read('day2_input')

lines = input.split("\n").map { |line| line.split("") }

code = lines.map do |line| 
	line.each do |direction| 
		keypad.move_finger(direction)
	end
	keypad.press_selected_button
	keypad.last_pressed_button
end

puts code.join("")