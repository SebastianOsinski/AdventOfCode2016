input = File.read("day7_input")

addresses = input.split("\n")

# part one

def contains_ABBA?(string)
  string.match(/([a-z])(?!\1)([a-z])\2\1/)
end

def supports_TSL?(address)
  address = address.dup
  hypernets = address.scan(/\[([a-z]+)\]/)

  if hypernets.map(&:first).any?(&method(:contains_ABBA?))
    return false
  end

  hypernets.each { |h| address.sub!(h[0], "") }

  rest = address.scan(/[a-z]+/)

  rest.any?(&method(:contains_ABBA?))
end

puts addresses.select(&method(:supports_TSL?)).size

#part two

def supports_SSL?(address)
  address.match(/([a-z])(?!\1)([a-z])\1.*\[[a-z]*\2\1\2[a-z]*\]/) ||
  address.match(/\[[a-z]*([a-z])(?!\1)([a-z])\1[a-z]*\].*\2\1\2/)
end

puts addresses.select(&method(:supports_SSL?)).size
