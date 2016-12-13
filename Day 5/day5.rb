require 'digest/md5'

door_id = 'ojvtpuvg'

md5 = Digest::MD5.new

index = 0
password = ''

while password.length < 8
  digest = md5.hexdigest(door_id + index.to_s)

  password += digest[5] if digest.start_with?('00000')

  index += 1
end

puts password

# second part

password = Array.new(8)
known_chars_count = 0
index = 0

while known_chars_count < 8
  digest = md5.hexdigest(door_id + index.to_s)

  if digest.start_with?('00000') && digest[5] =~ /\d/
    position = digest[5].to_i
    if position < 8 && password[position].nil?
      password[digest[5].to_i] = digest[6]
      known_chars_count += 1
    end
  end

  index += 1
end

puts password.join('')
