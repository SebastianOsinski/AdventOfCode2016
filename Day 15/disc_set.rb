require_relative 'disc'

class DiscSet

  def initialize(discs)
    @discs = discs
  end

  def can_go_through?(start_time)
    (0...@discs.length).each do |i|
      if !@discs[i].at_slot?(start_time + i + 1)
        return false
      end
    end
    true
  end
end
