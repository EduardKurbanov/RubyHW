# frozen_string_literal: true

p 'Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.'
p '([2, 4, 13, 2, 13].inject(0){ |sum, i| sum + i.abs }.to_f)/[2, 4, 13, 2, 13].size'
p [2, 4, 13, 2, 13].inject(0) { |sum, i| sum + i.pow(2) }.to_f / [2, 4, 13, 2, 13].size
