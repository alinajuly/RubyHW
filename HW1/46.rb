p 'Дан целочисленный массив. Найти максимальный отрицательный элемент.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'new_array = array.select { |element| element < 0 }.min'

new_array = array.select { |element| element < 0 }.min

p new_array