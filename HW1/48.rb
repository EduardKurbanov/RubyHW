# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность.'
p '(0...[1, 2, 3, 5, 4, 2, 3, 4].size).sort_by{ |i| [1, 2, 3, 5, 4, 2, 3, 4][i] }'
p(0...[1, 2, 3, 5, 4, 2, 3, 4].size).sort_by { |i| [1, 2, 3, 5, 4, 2, 3, 4][i] }
