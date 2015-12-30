require_relative "support/asserts"

def factorial(number)
  return 1 if number == 1
  number * factorial(number-1)
end
assert_equal 1, factorial(1)
assert_equal 2, factorial(2)
assert_equal 6, factorial(3)
assert_equal 24, factorial(4)
assert_equal 120, factorial(5)

def digit_sum(number)
  number.to_s.split("").map(&:to_i).reduce(:+)
end

p digit_sum(factorial(100))
