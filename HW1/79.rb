p 'Дан целочисленный массив. Возвести в квадрат отрицательные элементы и в третью степень - положительные. Нулевые элементы - не изменять.	'

p array = [0, -2, 3, 12, -10, 1, 3, 9, 10]

p 'new_array = array.map { |element| element < 0 ? element**2 : element**3 } '

new_array = array.map { |element| element < 0 ? element**2 : element**3 } 

p new_array