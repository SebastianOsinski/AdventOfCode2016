require_relative 'RegularKeypad'
require_relative 'WeirdKeypad'

def get_code(keypad, input)
  lines = input.split("\n").map { |line| line.split('') }

  code = lines.map do |line|
    line.each do |direction|
      keypad.move_finger(direction)
    end
    keypad.press_selected_button
    keypad.last_pressed_button
  end

  puts code.join('')
end

input = File.read('day2_input')

# input = "ULL\nRRDDD\nLURDL\nUUUUD"

get_code(WeirdKeypad.new, input)
