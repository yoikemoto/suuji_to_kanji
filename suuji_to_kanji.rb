puts "--数字を入力してください(半角数字)--"
exit_bool = false
first_sec = gets.to_s.chomp

if first_sec == "0"
	puts "零"
	exit_bool = true
else 
	num = first_sec.to_i
end

def suuji_to_kanji(num)
	return "!半角数字を入力してください!" if num == 0
	ketas = {
		5..8 => [false, "万"],
		9..12 => [false, "億"],
		13..16 => [false, "兆"],
		17..20 => [false, "京"],
		21..24 => [false, "垓"],
		25..28 => [false, "予"],
		29..32 => [false, "穣"],
		33..36 => [false, "溝"],
		37..40 => [false, "澗"],
		41..44 => [false, "正"],
		45..48 => [false, "裁"],
		49..52 => [false, "極"],
		53..56 => [false, "恒河沙"],
		57..60 => [false, "阿僧祇"],
		61..64 => [false, "那由多"],
		65..68 => [false, "不可思議"],
		69..72 => [false, "無量大数"],
	}
	

	answer = num.to_s.reverse.chars.map.with_index { |n, i|
		kanSuuji = " 一二三四五六七八九"[n.to_i]
		keta = [nil,"十","百","千"][i % 4] unless kanSuuji == " "

		bigKeta = " "
		ketas.each do |key, value|
			if kanSuuji != " " && value[0] == false && key.to_a.include?(i+1)
				bigKeta = value[1]
				value[0] = true
			end
		end
		
	if num == 10000000
		[bigKeta,keta, kanSuuji] 
	else
		[bigKeta,keta, (keta && kanSuuji == "一") ? nil : kanSuuji]
	end
	}.flatten.join("").reverse
	return answer.gsub(/ /, "")
end 
puts suuji_to_kanji(num) unless exit_bool

