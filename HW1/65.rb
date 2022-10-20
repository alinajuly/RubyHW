p 'Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'even_odd_array = array.select { |number| number.even? }.array.select { |number| number.odd? }'

even_odd_array = array.select { |number| number.even? } + array.select { |number| number.odd? }
	
p even_odd_array

p 'even_odd_array = array.partition { |number| number.even? }.flatten'

even_odd_array = array.partition { |number| number.even? }.flatten

p even_odd_array