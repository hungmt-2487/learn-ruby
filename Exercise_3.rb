# Cho 1 Hash quản lí ID và name (tự khai báo). Nhập ID, trả name ra màn hình và ngược lại 
info = [
  {id: 1, name: "Quan"},
  {id: 2, name: "Viet"},
  {id: 3, name: "Luan"}
]

def find_info arr
  p "Nhập điều kiện tìm kiếm"
  p "1. Tìm kiếm theo id"
  p "2. Tìm kiếm theo name"

  option = gets.to_i
  
  case option 

  when 1,2 
    print "Nhập giá trị tìm kiếm: "
  
    value =  option == 1 ? gets.to_i : gets.chomp
    search_key = option == 1  ? :id : :name
    value_key = option == 1 ? :name : :id

    result = arr.find{ |e| break e[value_key] if e[search_key] == value}
    p result ? "#{search_key} #{value} có #{value_key} là: #{result}" : "Không tìm thấy!!"
  
  else
    find_info arr
  end
end

find_info(info)
