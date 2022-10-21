p 'Дан целочисленный массив. Найти количество его локальных максимумов.'

p array = [2, 10, 1, 0, -4, 22, 9]

p 'count_local_max = array.each_index.select { |i| array[i] > array[i - 1] && array[i] > array[i + 1] }.count'

count_local_max = array.each_index.select { |i| array[i] > array[i - 1] && array[i] > array[i + 1] }.count

p count_local_max