# frozen_string_literal: true

p 'Дано натуральное число N. Если N - нечетное, то найти произведение 1*3*…*N; если N - четное, то найти произведение 2*4*…*N.'
p 'n = 7; p (1..n).inject(1){ |pr, e| pr= (e%2 ==n%2)? pr * e : pr }'
p n = 7
p(1..n).inject(1) { |pr, e| pr = e % 2 == n % 2 ? pr * e : pr }
