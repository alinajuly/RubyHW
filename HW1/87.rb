p 'Дан целочисленный массив. Найти все четные элементы.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p array.select {|element| element.even?}