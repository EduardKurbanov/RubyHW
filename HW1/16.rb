# frozen_string_literal: true

p 'Дан целочисленный массив. Найти все нечетные элементы.'
p '(1..10).to_a.select{ |i| i.odd? }'
p(1..10).to_a.select(&:odd?)
