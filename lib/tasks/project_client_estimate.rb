amount = 0
expact_value = 2400000 

# 项目随机10-120万

10.times do |j|
	t = 0
	10000000.times do |i|
		if rand(100) > 98
			t += 300
		end
		if t > expact_value
			puts "#{t}, #{i}"
			i > amount ? amount = i : amount
			break
		end
	end
end

puts amount