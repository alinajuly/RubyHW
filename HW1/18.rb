p 'Дан целочисленный массив. Найти количество его локальных минимумов.'

p array = [10, 3, 9, 0, -4, 22, 9]

p 'new_array = array.each_index.select { |i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.count'

new_array = array.each_index.select { |i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.count

p new_array