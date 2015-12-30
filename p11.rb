require "matrix"
require_relative "support/asserts"
require_relative "support/p11_grid"

mx = Matrix[*ROWS].map(&:to_i)


p mx.row_vectors.flat_map{|v| v.each_cons(4).to_a}.map{|digits| digits.reduce(:*)}.max
p mx.column_vectors.flat_map{|v| v.each_cons(4).to_a}.map{|digits| digits.reduce(:*)}.max
diagonal_max = mx.row_vectors.each_cons(4).flat_map do |rows|
  se = Matrix[rows[0][0..-4], rows[1][1..-3], rows[2][2..-2], rows[3][3..-1]]
  sw = Matrix[rows[0][3..-1], rows[1][2..-2], rows[2][1..-3], rows[3][0..-4]]
  se_products = se.transpose.to_a.map{|four| four.reduce(:*)}
  sw_products = sw.transpose.to_a.map{|four| four.reduce(:*)}
  se_products + sw_products
end.max
p diagonal_max
