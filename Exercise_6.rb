# Viết ứng dụng quản lí máy tính trong SUN 
# Lưu thông tin user, máy tính qua 1 file json 

# - Đăng nhập > nhập user/pass >  kiểm tra trong file json
# - kiểm tra quyền của user

# Nếu là Admin thì cho sử dụng các chức năng
# - thêm sửa xoá search info máy tính
# - thêm sửa xioá user

# Nếu là User thì cho sử dụng các chức năng
# - search info máy tính

require 'json'

$user_info = JSON.parse(File.read('./user.json'))

def login
  print "Nhap username: "
  username = gets.chomp

  print "Nhap password: "
  pass_word = gets.chomp

  user = $user_info.find{|e| e["user_name"] == username && e["password"] == pass_word}

  if user
    p "Dang nhap thanh cong"
    return user["role"]
  else
    p "Dang nhap that bai"
  end
end

def create_user
  print "Nhap id: "
  id = gets.chomp.to_i

  print "Nhap name: "
  name = gets.chomp

  print "Nhap role: "
  role = gets.chomp

  print "Nhap username: "
  user_name = gets.chomp

  print "Nhap password: "
  password = gets.chomp

  user = {"id": id, "name": name, "role": role, "user_name": user_name, "password": password}

  new_user_info = $user_info.push(user)

  File.open("./user.json", "w") do |f|
    f.puts JSON.pretty_generate(new_user_info) 
  end
end

def update_user

end

def delete_user
  print "Nhap id user can xoa: "
  id = gets.chomp.to_i

  new_user_info = $user_info.select{|user| user["id"] != id}

  File.open("./user.json", "w") do |f|
    f.puts JSON.pretty_generate(new_user_info) 
  end
end

def find_computer
  print "Nhap id computer: "
  id = gets.chomp.to_i

  computer_info = JSON.parse(File.read('./computers.json'))
  result = computer_info.find{ |e| break e if e["id"] == id}
  p result
end

def main
  user_role = login
  
  case user_role
  when "admin"
    p "1. Them user"
    p "2. Sua user"
    p "3. Xoa user"
    p "4. Them computer"
    p "5. Sua computer"
    p "6. Xoa computer"
    p "7. Tim kiem computer"

    option = gets.chomp.to_i

    case option
    when 1
      create_user
    when 2
      update_user
    when 3
      delete_user
    when 7
      find_computer
    end
  else
    p "1. Tim kiem computer"
  end
end

main
