# frozen_string_literal: true

p 'Дано натуральное число N. Найти результат следующего произведения 1*2*…*N.'
p '(1..5).map{ |x| x }.inject(1){ |x, y| x * y }'
p(1..5).map { |x| x }.inject(1) { |x, y| x * y }
