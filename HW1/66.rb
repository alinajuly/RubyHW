p 'Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'even_odd_array = array.select { |number| number.odd? } + array.select { |number| number.even? }'

even_odd_array = array.select { |number| number.odd? } + array.select { |number| number.even? }
	
p even_odd_array

p 'even_odd_array = array.partition { |number| number.odd? }.flatten'

even_odd_array = array.partition { |number| number.odd? }.flatten

p even_odd_array