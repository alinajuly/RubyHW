p 'Дан целочисленный массив. Найти количество его локальных максимумов.'

p array = [2, 10, 1, 0, -4, 22, 9]

p 'array.each_index.select { |i| array[i] > array[i - 1] && array[i] > array[i + 1] }.count'

new_array = array.each_index.select { |i| array[i] > array[i - 1] && array[i] > array[i + 1] }.count

p new_array