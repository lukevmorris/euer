require "matrix"
require_relative "support/p13_numbers.rb"

number_fronts = NUMBERS.map{|n| n[0..10].split("")}
mx = Matrix[*number_fronts].map(&:to_i)

sums = mx.transpose.row_vectors.map { |row| row.reduce(:+) }
max_power = sums.length - 1
sums.map.with_index do |sum, i|
  power = max_power - i
  sum * 10**power
end.reduce(:+)
