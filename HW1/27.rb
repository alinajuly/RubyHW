p 'Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.'

p array = [0, 2, 3, 1, -4]

p 'new_array = array.flat_map { |element| element.positive? && [element, array.first] || element }'

new_array = array.flat_map { |element| element.positive? && [element, array.first] || element }

p new_array