# frozen_string_literal: true

p '46 Дан целочисленный массив. Найти максимальный отрицательный элемент'
p '[-1, -5, 2, 3, -10, 50, 32, -6].select{ |n| n < 0 }.min'
p [-1, -5, 2, 3, -10, 50, 32, -6].select(&:negative?).min
