class RegularKeypad
  attr_reader :last_pressed_button

  def initialize
    @last_pressed_button = nil
    @currently_selected_button = 5
  end

  def move_finger(direction)
    case direction
    when 'U'
      @currently_selected_button -= 3 if @currently_selected_button > 3
    when 'D'
      @currently_selected_button += 3 if @currently_selected_button < 7
    when 'L'
      @currently_selected_button -= 1 if @currently_selected_button % 3 != 1
    when 'R'
      @currently_selected_button += 1 if @currently_selected_button % 3 > 0
    end
  end

  def press_selected_button
    @last_pressed_button = @currently_selected_button
  end
end