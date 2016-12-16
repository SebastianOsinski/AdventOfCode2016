class Computer

  def initialize()
    @registers = Hash.new(0)
    @counter = 0
  end

  def run_program(program)
    instructions = program.split("\n").map { |i| i.split(' ') }
    @counter = 0

    until @counter >= instructions.length do
      interpret_instruction(instructions[@counter])
    end
  end

  private def interpret_instruction(instruction)
    case instruction[0]
    when 'cpy'
      copy(instruction[1], instruction[2])
    when 'inc'
      increase(instruction[1])
    when 'dec'
      decrease(instruction[1])
    when 'jnz'
      jump_if_not_zero(instruction[1], instruction[2])
    else
      raise 'Unknown instruction'
    end
  end

  private def copy(from, to)
    if from.is_i?
      @registers[to] = from.to_i
    else
      @registers[to] = @registers[from]
    end

    @counter += 1
  end

  private def increase(register)
    @registers[register] += 1
    @counter += 1
  end

  private def decrease(register)
    @registers[register] -= 1
    @counter += 1
  end

  private def jump_if_not_zero(x, n)
    c = x.is_i? ? x.to_i : @registers[x]

    if c != 0
      @counter += n.to_i
    else
      @counter += 1
    end
  end

  def set_register(name, value)
    @registers[name] = value
  end

  def get_register(name)
    @registers[name]
  end
end

class String
    def is_i?
       !!(self =~ /\A[-+]?[0-9]+\z/)
    end
end
