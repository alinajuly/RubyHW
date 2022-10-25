p array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

p 'дізнатись кількість елементів в масиві'
p array.size

p 'перевернути масив'
p array.reverse

p 'знайти найбільше число'
p array.max

p 'знайти найменше число'
p array.min

p 'відсортувати від меншого до більшого'
p array.sort

p 'відсортувати від більшого до меншого'
p array.sort.reverse

p 'видалити всі непарні числа'
p array.select(&:even?)

p 'залишити тільки ті числа, які без остачі ділятся на 3'
p array.select { |number| (number % 3).zero? }

p 'видалити з масиву числа, які повторюються (тобто, потрібно вивести масив, в якому немає повторень)'
p array.uniq

p 'розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого'
p array.map { |number| number.to_f / 10 }

p 'отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві'
p new_array = ('a'..'z').to_a.select.with_index { |element, i| array.include?(i) }

p 'змінити місцями мінімальний і максимальний елементи масиву'
array[array.index(array.min)], array[array.index(array.max)] = array[array.index(array.max)], array[array.index(array.min)]
p array

p 'знайти елементи, які знаходяться перед мінімальним числом в масиві'
p array[0...array.index(array.min)]

p 'необхідно знайти три найменших елементи'
p array.min(3)