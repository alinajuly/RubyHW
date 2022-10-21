p 'Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.'

p array = [9, -2, 3, 12, -10, 1, 3, -3, 10]

p 'arithmetic_mean_modules = array.inject(0) { |sum, i| sum + i.abs }.to_f  / array.size'

arithmetic_mean_modules = array.inject(0) { |sum, i| sum + i.abs }.to_f  / array.size

p arithmetic_mean_modules