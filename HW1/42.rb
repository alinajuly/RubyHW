p 'Дан целочисленный массив. Найти минимальный нечетный элемент.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'new_array = array.select { |number| number.odd? }.min'

new_array = array.select { |number| number.odd? }.min

p new_array