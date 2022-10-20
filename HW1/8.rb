'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять.'

p array = [9, -95, 70, 44, 15, 37, 10, -20, 17, 30]

p 'new_array = array.map.with_index { |element, index| ![0, array.length - 1].include?(index) && element.odd? && element + array[0] || element }'

new_array = array.map.with_index { |element, index| ![0, array.length - 1].include?(index) && element.odd? && element + array[0] || element }

p new_array