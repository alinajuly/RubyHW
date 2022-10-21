p 'Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'arithmetic_mean_square = array.inject(0) {|sum, n| sum + n ** 2}.to_f  / array.size'

arithmetic_mean_square = array.inject(0) {|sum, n| sum + n ** 2}.to_f  / array.size

p arithmetic_mean_square