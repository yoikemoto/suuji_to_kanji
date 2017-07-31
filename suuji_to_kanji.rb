puts "--数字を入力してください(半角数字)--"
exitBool = false
first_sec = gets.to_s.chomp
# 0ならば零を 文字ならば suuji_to_kanjiメソッドでnum=0になる
if first_sec == "0"
	puts "零"
	exitBool = true
else  num = first_sec.to_i  end

def suuji_to_kanji(num)
	return "!半角数字を入力してください!" if num == 0

	#桁のハッシュを用意 keyは桁数の範囲 valueは重複防止の真偽値と、桁の文字
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
	

	#入力データを最小桁から処理していくので、str型にしてリバースをかける
	#数字1つずつ配列にして、nに格納する。何桁目の処理かどうかはiを使う
	answer = num.to_s.reverse.chars.map.with_index { |n, i|
		# 	puts "#{i+1}桁目のターン"
		kanSuuji = " 一二三四五六七八九"[n.to_i]
		keta = [nil,"十","百","千"][i % 4] unless kanSuuji == " "
		# puts "#{n}は「#{kanSuuji}」に変わり、単位は「#{keta}」がつく"

		bigKeta = " "
		ketas.each do |key, value|
			if kanSuuji != " " && value[0] == false && key.to_a.include?(i+1)
				bigKeta = value[1]
				value[0] = true
				# puts "更に大きい単位 「#{bigKeta}」がつく"
		end
	end
	if num == 10000000
	[bigKeta,keta, kanSuuji] 
	else
	[bigKeta,keta, (keta && kanSuuji == "一") ? nil : kanSuuji]
	end
	# exp1 ? exp2 : exp3 ← expが真ならexp2を、でなければexp3を返す
	# 配列ketaが存在して（trueで）kanSuujiが"一"なら無を返す
	}.flatten.join("").reverse
	return answer.gsub(/ /, "")
	#邪魔な空白を/ /で指定して ""で潰す
end 
puts suuji_to_kanji(num) if exitBool == false

