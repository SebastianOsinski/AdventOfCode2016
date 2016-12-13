require 'digest/md5'

door_id = "ojvtpuvg"

md5 = Digest::MD5.new

index = 0
password = ""

while password.length < 8 do
  digest = md5.hexdigest(door_id + index.to_s)

  if digest.start_with?("00000")
    password += digest[5]
  end

  index += 1
end

puts password


# second part

password = Array.new(8)
known_chars_count = 0
index = 0

while known_chars_count < 8 do
  digest = md5.hexdigest(door_id + index.to_s)

  if digest.start_with?("00000") && /\d/ === digest[5]
  position = digest[5].to_i
    if position < 8 && password[position] == nil
      password[digest[5].to_i] = digest[6]
      known_chars_count += 1
    end
  end

  index += 1
end

puts password.join("")