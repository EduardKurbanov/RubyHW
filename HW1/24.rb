# frozen_string_literal: true

p 'Дано число А и натуральное число N. Найти результат следующего выражения 1 + А + А*2 + А*3 + … + А*N.'
p '(0..N).map{ |x| x * A }.inject(1){ |x, y| x + y } A = 24 N = 36'
p(0..36).map { |x| x * 24 }.inject(1) { |x, y| x + y }
