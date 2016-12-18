class FloorGenerator

  def generate(initial_row, rows_count)
    floor = ''
    previous_row = initial_row.dup

    floor << previous_row
    floor << "\n"
    (rows_count - 1).times do |i|
      new_row = generate_row(previous_row)
      floor << new_row
      previous_row = new_row

      if i != (rows_count - 2)
        floor << "\n"
      end
    end

    floor
  end

  private def generate_row(previous_row)
    previous_row = previous_row.dup

    previous_row.insert(0, '.')
    previous_row << '.'

    (0...(previous_row.length - 2)).map { |i|
        generate_tile(previous_row[i, 3])
    }.join('')
  end

  private def generate_tile(previous_tiles)
    case previous_tiles
    when '^^.', '.^^', '^..', '..^'
      '^'
    else
      '.'
    end
  end
end