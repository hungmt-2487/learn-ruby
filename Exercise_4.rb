# Có 1 mảng các hash như sau:

# [{"Hanoi": ["CauGiay", "vung xanh"] },  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]

# Biến đổi về các dạng:
# {"vung xanh": ["Cau Giay - Hanoi", "Metri, Hanoi"], "vung do": ["LongBien - Hanoi"] }

array_hash = [{"Hanoi" => ["CauGiay", "vung xanh"] },  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]

def convert_array_to_hash array
  hash_convert = {}

  array.map{ |k| 
    key = k.values[0][1]
    value = "#{k.values[0][0]} - #{k.keys[0]}"

    if hash_convert.has_key? key
      hash_convert[key] = hash_convert[key].push(value)
    else 
      hash_convert[key] = [value]
    end
  }

  return hash_convert
end

p convert_array_to_hash(array_hash)
# {"vung xanh"=>["CauGiay - Hanoi", "Metri - Hanoi"], "vung do"=>["LongBien - Hanoi"]}
