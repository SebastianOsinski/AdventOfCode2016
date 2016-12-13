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