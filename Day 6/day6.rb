# input = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"
input = File.read('day6_input')

lines = input.split("\n")

n = lines[0].size

columns = lines.each_with_object(Array.new(n) { [] }) do |line, acc|
  (0...n).each do |i|
    acc[i] << line[i]
  end
end
password = columns.map do |column|
  chars_count = column.each_with_object(Hash.new(0)) { |elem, acc| acc[elem] += 1 }
  # column.max_by { |v| chars_count[v] } part 1
  column.min_by { |v| chars_count[v] } # part 2
end

puts password.join('')
