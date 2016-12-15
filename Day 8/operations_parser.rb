require_relative 'operation'

class OperationsParser
  def parse(input)
    input.split("\n").map do |line|
      case line
      when /rect (\d+)x(\d+)/
        Operation.new(:rect, Regexp.last_match[1].to_i, Regexp.last_match[2].to_i)
      when /rotate row y=(\d+) by (\d+)/
        Operation.new(:rotate_row, Regexp.last_match[1].to_i, Regexp.last_match[2].to_i)
      when /rotate column x=(\d+) by (\d+)/
        Operation.new(:rotate_column, Regexp.last_match[1].to_i, Regexp.last_match[2].to_i)
      else
        raise 'Unknown operation'
      end
    end
  end
end
