p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.'

p array = [8, -95, 70, 44, 15, 37, 10, -20, 17, 26]

p 'new_array = array.map.with_index { |element, index| ![0, array.length - 1].include?(index) && element.even? && element + array[array.length - 1] || element }'

new_array = array.map.with_index { |element, index| ![0, array.length - 1].include?(index) && element.even? && element + array[array.length - 1] || element }

p new_array