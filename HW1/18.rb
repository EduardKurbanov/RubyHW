# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные.'
p '(1..10).to_a.select{ |i| i.even? } + (1..10).to_a.select{ |i| i.odd? }'
p (1..10).to_a.select(&:even?) + (1..10).to_a.select(&:odd?)
p '(1..10).to_a.partition { |i| i.even?}.flatten(1)'
p (1..10).to_a.partition { |i| i.even?}.flatten(1)
