p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'

p array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

even_index_array = []
odd_index_array = []
array.each_with_index do |item,index| 
    if (index % 2 == 0)
      even_index_array.push(item) 
    else 
			odd_index_array.push(item) 
    end
end

p even_index_array
p odd_index_array
p even_index_array.concat(odd_index_array)