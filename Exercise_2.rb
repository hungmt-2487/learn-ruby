# Khởi tạo một mảng gồm n  số tự nhiên sau đó hiển thị các dãy con tăng trong mảng.

# ex: 
# input: [5,3,6,7,8,3,4,7,0,1,3,2,8]
# output: [3,6,7,8] , [3,4,7], [0,1,3], [2,8] => Sai đề

def increasing_subsequence arr
  increase = []

  first_index = 0
  last_index = 0

  for i in 0..arr.length-2
    last_index = i+1 if arr[i] <= arr[i+1]

    if arr[i] > arr[i+1] || arr[i+2] == nil
      increase[increase.length] = arr[first_index..last_index] 
      first_index, last_index = last_index + 1
    end
    
    i += 1
  end

  return increase
end

array = [5,3,6,7,8,3,4,7,0,1,3,2,8]

p increasing_subsequence(array)
# [[5], [3, 6, 7, 8], [3, 4, 7], [0, 1, 3], [2, 8]]
