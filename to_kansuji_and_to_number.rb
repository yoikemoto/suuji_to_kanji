input_msg = gets.to_i

class String
  def to_number
  end
end


class Integer
	def to_kansuji
		cardinal = %w(零 一 二 三 四 五 六 七 八 九)
		base_unit = %w(十 百 千)
		super_unit = %w(万 億 兆 京 垓 予 穣 溝 澗 正 裁 極 恒河沙 阿僧祇 那由多 不可思議 無量大数)
		return "零"  if self == 0

		numbers = []
		self.to_s.chars{|num| numbers << num.to_i}
		puts "numbers: #{numbers}"
		number_block = numbers.reverse.each_slice(4).to_a
		puts "number_block: #{number_block}"

		japanese = ""
		block_size = number_block.size
		puts "block_size: #{block_size} number_block.size: #{number_block.size}"

		number_block.reverse.each_with_index do |block, index|
			str = ""
			puts "block: #{block}  index: #{index}"
			block.each_with_index do |num, unit|
				puts "unit: #{unit} num: #{num}"
				if num != 0
					str += base_unit[unit-1] if unit.nonzero?
				if num == 1
					if unit == 0 || unit == 3
						if index != block_size-1
						puts "いち"
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
			puts "str: #{str}"
		japanese += str.reverse
		japanese += super_unit[number_block.size-(index+2)] if str.size.nonzero? && block_size != index+1
		end
		return japanese
	end
end
puts input_msg.to_kansuji