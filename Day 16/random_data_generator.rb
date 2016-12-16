class RandomDataGenerator
  def generate(seed, size)
    result = seed.dup

    until result.length >= size
      temp = result.reverse.chars.map { |c| c == '0' ? '1' : 0 }.join('')
      result = result + '0' + temp
    end

    result[0...size]
  end
end