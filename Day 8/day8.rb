require_relative 'screen'

screen = Screen.new(10, 10)

screen.rect(2, 3)
puts screen
puts "\n"
screen.rotate_column(2, 3)
puts screen
puts "\n"
screen.rotate_row(3, 1)
puts screen
puts "\n"
puts screen.lit_pixels_count