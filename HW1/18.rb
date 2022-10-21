p 'Дан целочисленный массив. Найти количество его локальных минимумов.'

p array = [10, 3, 9, 0, -4, 22, 9]

p 'count_local_min = array.each_index.select { |i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.count'

count_local_min = array.each_index.select { |i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.count

p count_local_min