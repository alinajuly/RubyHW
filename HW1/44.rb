p 'Дан целочисленный массив. Найти максимальный нечетный элемент.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'new_array = array.select { |number| number.odd? }.max'

new_array = array.select { |number| number.odd? }.max

p new_array