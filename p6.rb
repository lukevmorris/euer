require_relative "support/asserts"

def sum_of_squares(number)
  1.upto(number).reduce(0) { |sum, n| sum + n**2 }
end
assert_equal 1, sum_of_squares(1)
assert_equal 5, sum_of_squares(2)
assert_equal 385, sum_of_squares(10)

def square_of_sums(number)
  1.upto(number).reduce(:+) ** 2
end
assert_equal 1, square_of_sums(1)
assert_equal 9, square_of_sums(2)
assert_equal 3025, square_of_sums(10)

def meta_diff(number)
  square_of_sums(number) - sum_of_squares(number)
end
assert_equal 0, meta_diff(1)
assert_equal 4, meta_diff(2)
assert_equal 2640, meta_diff(10)

p meta_diff(100)
