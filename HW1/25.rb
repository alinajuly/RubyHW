p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.'

p array = [0, 2, 3, 1, -4]

p 'new_array = array.flat_map { |element| element.positive? && [array.first, element] || element }'

new_array = array.flat_map { |element| element.positive? && [array.first, element] || element }

p new_array