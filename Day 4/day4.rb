#input = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"
input = File.read("day4_input")

#rooms = ["qzmt-zixmtkozy-ivhz-343[zimth]"]
rooms = input.split("\n")

def room_valid?(name, checksum)
	name = name.gsub("-", "")
	
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

def tokenize_room(room) 
	room.match(/(\A[a-z\-]+)-(\d+)\[([a-z]+)\]\z/).captures
end

def sum_of_valid_room_ids(rooms)
	rooms.reduce(0) do |acc, room|
		name, id, checksum = tokenize_room(room)
		
	 	room_valid?(name, checksum) ? acc + id.to_i : acc
	end
end

puts sum_of_valid_room_ids(rooms)

# second part

def decode(name, id)
	id = id.to_i
	
	a = "a".ord
	z = "z".ord + 1
	
	l = z - a
	
	n = id % l
	
	name.chars.map { |c| c == '-' ? ' ' : (((c.ord + n - a) % l) + a).chr }.join("")
end

def decode_valid_room_names(rooms)
	rooms.each do |room|
		name, id, checksum = tokenize_room(room)
		
		puts "#{decode(name, id)} #{id}" if room_valid?(name, checksum)
	end
end

decode_valid_room_names(rooms)