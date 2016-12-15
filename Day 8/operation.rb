class Operation
  attr_reader :type
  attr_reader :first_argument
  attr_reader :second_argument

  def initialize(type, first_argument, second_argument)
    @type = type
    @first_argument = first_argument
    @second_argument = second_argument
  end

  def to_s
    "#{@type}: #{@first_argument}, #{@second_argument}"
  end
end
