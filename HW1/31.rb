p 'Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.'

p array = [1, 3, 2, 4]

p 'array.map{ |element| array.sort.index(element)}.reverse'

p array.map{ |element| array.sort.index(element)}.reverse