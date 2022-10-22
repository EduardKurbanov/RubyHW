# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.'
p '(1..10).to_a.select{ |i| i.odd? } + (1..10).to_a.select{ |i| i.even? }'
p (1..10).to_a.select(&:odd?) + (1..10).to_a.select(&:even?)
