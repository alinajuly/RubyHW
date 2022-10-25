p 'Дан целочисленный массив. Найти минимальный четный элемент.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'new_array = array.select { |number| number.even? }.min'

# new_array = array.select { |number| number.even? }.min

new_array = array.select { &:even? }.min

p new_array