p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.'

p array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p 'odd_even_array = array.partition.each_with_index { |_, i| i.odd? }.flatten'

  odd_even_array = array.partition.each_with_index { |_, i| i.odd? }.flatten

p odd_even_array

p 'odd_even_array = array.select.each_with_index { |_, i| i.odd? } + array.select.each_with_index { |_, i| i.even? }'

  odd_even_array = array.select.each_with_index { |_, i| i.odd? } + array.select.each_with_index { |_, i| i.even? }
	
p odd_even_array