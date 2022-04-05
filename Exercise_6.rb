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
$computer_info = JSON.parse(File.read('./computers.json'))

def login
  p "********* LOGIN *************"
  print "Nhap username: "
  username = gets.chomp

  print "Nhap password: "
  pass_word = gets.chomp

  user = $user_info.find{|e| e["user_name"] == username && e["password"] == pass_word}

  if user
    p "Dang nhap thanh cong, role: #{user["role"]}"
    return user["role"]
  else
    p "Dang nhap that bai"
  end
end

def create_user
  p "********* THEM USER *************"
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
  p "********* SUA USER *************"

end

def delete_user
  p "********* XOA USER *************"
  print "Nhap id user can xoa: "
  id = gets.chomp.to_i

  new_user_info = $user_info.select{|user| user["id"] != id}

  File.open("./user.json", "w") do |f|
    f.puts JSON.pretty_generate(new_user_info) 
  end
end

def create_computer
  p "********* THEM COMPUTER *************"
  print "Nhap id: "
  id = gets.chomp.to_i

  print "Nhap name: "
  name = gets.chomp

  print "Nhap code: "
  role = gets.chomp

  print "Nhap info: "
  info = gets.chomp

  computer = {"id": id, "name": name, "code": code, "info": info}

  new_computer_info = $computer_info.push(computer)

  File.open("./computers.json", "w") do |f|
    f.puts JSON.pretty_generate(new_computer_info) 
  end
end

def update_computer
  p "********* SUA COMPUTER *************"

end

def delete_computer
  p "********* XOA COMPUTER *************"
  print "Nhap id computer can xoa: "
  id = gets.chomp.to_i

  new_computer_info = $computer_info.select{|cp| cp["id"] != id}

  File.open("./computers.json", "w") do |f|
    f.puts JSON.pretty_generate(new_computer_info) 
  end
end

def find_computer
  p "********* TIM KIEM COMPUTER *************"
  print "Nhap id computer: "
  id = gets.chomp.to_i

  result = $computer_info.find{ |e| break e if e["id"] == id}
  p result
end

def main
  user_role = login
  
  case user_role
  when "admin"
    p "********* MENU *************"
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
    when 4
      create_computer
    when 5
      update_computer
    when 6
      delete_computer
    when 7
      find_computer
    else
      exit
    end
  else
    p "********* MENU *************"
    p "1. Tim kiem computer"
    option = gets.chomp.to_i

    case option
    when 1
      find_computer
    else
      exit
    end
  end
end

main
