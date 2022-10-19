p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'

p array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p 'even_odd_array = array.partition.each_with_index { |_, i| i.even? }'

  even_odd_array = array.partition.each_with_index { |_, i| i.even? }.flatten

p even_odd_array

p 'even_odd_array = array.select.each_with_index {|_, i| i.even?} + array.select.each_with_index{|_, i| i.odd?}'

	even_odd_array = array.select.each_with_index {|_, i| i.even?} + array.select.each_with_index{|_, i| i.odd?}
	
p even_odd_array