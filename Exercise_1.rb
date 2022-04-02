# Nhập vào một mảng gồm n  số từ bàn phím (quá trình nhập sẽ dừng khi người sử dụng nhập vào giá trị là chữ) sau đó 
# - hiển thị mảng vừa nhập 
# - hiển thị giá trị nhỏ nhất của mảng ra màn hình.
# - tính giá trị trung bình của mảng
# - tính tổng của mảng. dùng inject
# - tìm các phần tử có giá trị > 10
# - tìm phần tử đầu tiên có giá trị > 10

def create_array
  print "Độ dài mảng: "
  n = gets.to_i

  arr = []

  regex = Regexp.new /^[0-9]/

 for i in 0..n-1
    print "Nhập phần tử #{i}: "
    value = gets

    if value.match regex
      arr[i] = value.to_i
      i += 1
    else
      break
    end
  end

  return arr
end

def main
  number_arr = create_array
  sum = number_arr.inject{ |sum, e| sum += e }
  all_values_greater_10 = number_arr.select{ |e| e > 10 }
  first_value_greater_10 = number_arr.detect{ |e| e > 10 }

  p "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  p "Mảng vừa nhập : #{number_arr}"
  p "Giá trị nhỏ nhất trong mảng: #{number_arr.min}"
  p "Tổng của mảng: #{sum}"
  p "Giá trị trung bình của mảng: #{sum/number_arr.length}"
  p "Các phần tử có giá trị > 10: #{all_values_greater_10}"
  p "Phần tử đầu tiên có giá trị > 10: #{first_value_greater_10}"
end

main
