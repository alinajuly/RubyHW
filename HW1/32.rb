p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность.'

p array = [1, 3, 2, 4]

p 'array.map{ |element| array.sort.index(element)}'

p array.map{ |element| array.sort.index(element)}