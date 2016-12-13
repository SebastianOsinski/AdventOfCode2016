#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#	    D

class WeirdKeypad
  attr_reader :last_pressed_button

  def initialize
    @last_pressed_button = nil
    @currently_selected_button = 5
    @available_moves = {
      1 => { 'D' => 3 },
      2 => { 'D' => 6, 'R' => 3 },
      3 => { 'U' => 1, 'D' => 7, 'L' => 2, 'R' => 4 },
      4 => { 'D' => 8, 'L' => 3 },
      5 => { 'R' => 6 },
      6 => { 'U' => 2, 'D' => 'A', 'L' => 5, 'R' => 7 },
      7 => { 'U' => 3, 'D' => 'B', 'L' => 6, 'R' => 8 },
      8 => { 'U' => 4, 'D' => 'C', 'L' => 7, 'R' => 9 },
      9 => { 'L' => 8 },
      'A' => { 'U' => 6, 'R' => 'B' },
      'B' => { 'U' => 7, 'D' => 'D', 'L' => 'A', 'R' => 'C' },
      'C' => { 'U' => 8, 'L' => 'B' },
      'D' => { 'U' => 'B' }
    }
  end

  def move_finger(direction)
    available_moves = @available_moves[@currently_selected_button]
    new_selected_button = available_moves[direction] unless available_moves.nil?
    @currently_selected_button = new_selected_button unless new_selected_button.nil?
  end

  def press_selected_button
    @last_pressed_button = @currently_selected_button
  end
end
