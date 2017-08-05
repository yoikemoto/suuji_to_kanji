input_msg = gets.chomp

class String
	def to_number
		cardinal = {
		'〇'=>0,
		'一'=>1, 
		'二'=>2, 
		'三'=>3, 
		'四'=>4,
		'五'=>5,
		'六'=>6,
		'七'=>7,
		'八'=>8,
		'九'=>9
		}
		base_unit = %w(十 百 千)
		s_unit = %w(万 億 兆 京 垓 予 穣 溝 澗 正 裁 極 恒河沙 阿僧祇 那由多 不可思議 無量大数)

		cardinal_value = 0
		base_unit_value = {}
		base_unit.each{|index| base_unit_value[index] = 0}
		s_unit_value = {}
		s_unit.each{|index| s_unit_value[index] = 0}

		self.each_char{|kanji|
			if  value = cardinal[kanji]
				cardinal_value = cardinal_value * 10 + value
			elsif base_unit.include?(kanji)
				if cardinal_value == 0 
					cardinal_value = 1
				end
				base_unit_value[kanji] = cardinal_value
				cardinal_value = 0
			elsif s_unit.include?(kanji)
				s_unit_value[kanji] = 
				base_unit_value['千'] * 1000 +
				base_unit_value['百'] * 100 +
				base_unit_value['十'] * 10 +
				cardinal_value
				cardinal_value = 0
				base_unit.each{|index|base_unit_value[index] = 0}
			else
				raise "(#{self.inspect})は不正な文字列です"
			end		
		}
		suji = 0
		s_unit.reverse.each{|kanji,|
		suji = suji * 10000 + s_unit_value[kanji]
		}
		suji = 
		suji * 10000 +
		base_unit_value['千'] * 1000 +
		base_unit_value['百'] * 100 +
		base_unit_value['十'] * 10 +
		cardinal_value

		return suji
	end
end
# puts input_msg.to_number

class Integer
	def to_kansuji
		cardinal = %w(零 一 二 三 四 五 六 七 八 九)
		base_unit = %w(十 百 千)
		super_unit = %w(万 億 兆 京 垓 予 穣 溝 澗 正 裁 極 恒河沙 阿僧祇 那由多 不可思議 無量大数)
		return "零"  if self == 0

		numbers = []
		self.to_s.chars{|num| numbers << num.to_i}
		number_block = numbers.reverse.each_slice(4).to_a

		japanese = ""
		block_size = number_block.size

		number_block.reverse.each_with_index do |block, index|
			str = ""
			block.each_with_index do |num, unit|
				if num != 0
					str += base_unit[unit-1] if unit.nonzero?
				if num == 1
					if unit == 0 || unit == 3
						if index != block_size-1
							str += cardinal[num]
						else
							str += cardinal[num]  if str.size == 0
						end
					end
				else
					str += cardinal[num]
				end
				end
			end
		japanese += str.reverse
		japanese += super_unit[number_block.size-(index+2)] if str.size.nonzero? && block_size != index+1
		end
		return japanese
	end
end

if input_msg =~ /^[0-9]+$/
	puts input_msg.to_i.to_kansuji
else
	puts input_msg.to_number
end
