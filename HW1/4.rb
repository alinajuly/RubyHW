p 'Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. 
Если таких элементов нет, то вывести [ ].'

p array = [8, -95, 70, 44, 15, 37, 10, -20, 17, 25]

p 'element_index = Array(array.reverse.index { |i| array[0] < i && i < array[-1] })'

element_index = Array(array.reverse.index { |i| array[0] < i && i < array[-1] })

p element_index