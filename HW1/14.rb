# frozen_string_literal: true

p 'Дан целочисленный массив. Найти все четные элементы.'
p '(1..10).to_a.select{ |i| i.even? }'
p(1..10).to_a.select(&:even?)
