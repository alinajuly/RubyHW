p 'Дан целочисленный массив. Найти максимальный четный элемент.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'new_array = array.select { |number| number.even? }.max'

new_array = array.select { |number| number.even? }.max

p new_array