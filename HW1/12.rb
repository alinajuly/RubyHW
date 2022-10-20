p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'

p array = [9, -95, 70, 44, -15, 37, 10, -20, 17, -30]

p 'new_array = array.map { |element| element < 0 ? array.select{ |value| value < 0 }.min : element}'

new_array = array.map { |element| element < 0 ? array.select{ |value| value < 0 }.min : element}

p new_array