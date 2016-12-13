def contains_ABBA?(string)
  string.match(/([a-z])(?!\1)([a-z])\2\1/)
end


def address_valid?(address)
  address = address.dup
  hypernets = address.scan(/\[([a-z]+)\]/)

  if hypernets.map(&:first).any?(&method(:contains_ABBA?))
    return false
  end

  hypernets.each { |h| address.sub!(h[0], "") }

  rest = address.scan(/[a-z]+/)

  rest.any?(&method(:contains_ABBA?))
end

input = File.read("day7_input")

addresses = input.split("\n")

puts addresses.select(&method(:address_valid?)).size
