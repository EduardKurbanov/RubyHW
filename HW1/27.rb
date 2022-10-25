# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество его локальных максимумов.'
arr = [1,1,2,3,4,5,6,7,2,3,4,5,6,9]
p '(1..arr.size - 2).to_a.select { |i| (arr[i] > arr[i - 1]) && (arr[i] > arr[i + 1]) }.size'
p (1..arr.size - 2).to_a.select { |i| (arr[i] > arr[i - 1]) && (arr[i] > arr[i + 1]) }.size
