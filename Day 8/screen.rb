require_relative 'mutable_matrix'

class Screen
  def initialize(row_count, col_count)
    @screen = MutableMatrix.build(row_count, col_count) { |_| false }
  end

  def lit_pixels_count
    @screen.to_a.flatten.reduce(0) { |acc, elem| acc + (elem ? 1 : 0) }
  end

  def rect(width, height)
    (0...width).each do |w|
      (0...height).each do |h|
        @screen[w, h] = true
      end
    end
  end

  def rotate_column(col, n)
    old_column = @screen.column(col)
    column_length = old_column.size

    (0...column_length).each do |row|
      old_row = (row - n) % column_length
      @screen[row, col] = old_column[old_row]
    end
  end

  def rotate_row(row, n)
    old_row = @screen.row(row)
    row_length = old_row.size

    (0...row_length).each do |col|
      old_column = (col - n) % row_length
      @screen[row, col] = old_row[old_column]
    end
  end

  def to_s
    string = ''
    @screen.to_a.each do |row|
      string += row.map { |on| on ? '#' : '.' }.join('') + "\n"
    end
    string
  end
end
