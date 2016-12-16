require_relative 'random_data_generator'
require_relative 'checksum_generator'

input = '10011111011011001'

data_generator = RandomDataGenerator.new
checksum_generator = ChecksumGenerator.new

data = data_generator.generate(input, 35651584)

puts checksum_generator.generate(data)

