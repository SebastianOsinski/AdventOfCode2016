#input = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"
input = File.read("day4_input")
rooms = input.split("\n")

def room_valid?(name, checksum)
	name.gsub!("-", "")
	
	letters_count = Hash.new(0)
	
	name.split("").each { |l| letters_count[l] += 1 }
	
	
	sorted_letters_count = letters_count.sort do |a, b|
		if a[1] != b[1]
			b[1] - a[1]
		else
			a[0] <=> b[0]
		end
	end
	
	valid_checksum = sorted_letters_count.first(5).map { |e| e[0] }.join("")
	
	valid_checksum == checksum
end

def sum_of_valid_room_ids(rooms)
	rooms.reduce(0) do |acc, room|
		name, id, checksum = room.match(/(\A[a-z\-]+)-(\d+)\[([a-z]+)\]\z/).captures
		
	 	room_valid?(name, checksum) ? acc + id.to_i : acc
	end
end

puts sum_of_valid_room_ids(rooms)