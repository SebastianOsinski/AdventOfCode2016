class Disc
  
  def initialize(positions_count, starting_position)
    @positions_count = positions_count
    @starting_position = starting_position
  end

  def position_for_time(time)
    (@starting_position + time) % @positions_count
  end

  def at_slot?(time)
    position_for_time(time) == 0
  end
end
