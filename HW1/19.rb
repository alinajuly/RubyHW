p 'Дан целочисленный массив. Найти максимальный из его локальных максимумов.'

p array = [2, 10, 1, 0, -4, 22, 9]

p 'local_max = array.select.each_with_index { |element, i| array[i] > array[i - 1] && array[i] > array[i + 1] }.max'

local_max = array.select.each_with_index { |element, i| array[i] > array[i - 1] && array[i] > array[i + 1] }.max

p local_max