# Nhập vào chuỗi 
# - Đảo ngược chuỗi
# - Bỏ dấu space
# - kiểm tra chuỗi có phải định dạng email không 

# *Phân biệt string và symbol

def string_reverse
  print "Nhập chuỗi: "
  str = gets.chomp

  regex = Regexp.new /^[^\s@]+@[^\s@]+\.[^\s@]+$/

  if str.match regex
    p "Đúng định dạng email"
  else
    p "Không đúng định dạng email"
  end

  str_reverse = ""
  i = str.length  

  while i > 0
    i -= 1
    str_reverse += str[i] if str[i] != " "
  end

  p str_reverse
end

string_reverse
