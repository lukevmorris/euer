require_relative "support/p8_digits.rb"
require_relative "support/asserts"

def adj_product(digit_count)
  DIGITS.split("").each_cons(digit_count).map do |digits|
    digits.map(&:to_i).reduce(:*)
  end.max
end
assert_equal 9, adj_product(1)
assert_equal 81, adj_product(2)
assert_equal 5832, adj_product(4)

p adj_product(13)
