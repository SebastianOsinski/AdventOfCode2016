class ChecksumGenerator
  def generate(data)
    checksum = data.dup.chars

    until checksum.length.odd?
      checksum = checksum
                 .each_slice(2)
                 .to_a
                 .map { |s| s[0] == s[1] ? '1' : '0' }
    end

    checksum.join('')
  end
end