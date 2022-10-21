p 'Дан целочисленный массив. Найти минимальный из его локальных минимумов.'

p array = [2, 10, 1, 0, -4, 22, 9]

p 'local_min = array.select.each_with_index { |element, i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.min'

local_min = array.select.each_with_index { |element, i| array[i] < array[i - 1] && array[i + 1] && array[i] < array[i + 1] }.min

p local_min