p 'Дан целочисленный массив. Найти индекс первого минимального элемента.'

p array = [10, 3, 9, 0, -4, 22, 9]

# p 'index_min = array.each_index.find { |i| array[i] < array[i - 1] }'

# # index_min = array.each_index.find { |i| array[i] < array[i - 1] }

# p index_min

index_min = array.each_index.find { |i| array[i] < array[i - 1] && array[i] < array[i + 1] }

p index_min
