require_relative "support/asserts"

def fzbz?(n)
  n % 3 == 0 || n % 5 == 0
end
assert_equal true, fzbz?(3)
assert_equal true, fzbz?(5)
assert_equal true, fzbz?(15)
assert_equal false, fzbz?(4)

def fizzbuzz_sum(number)
  (1...number).select{|n| fzbz?(n)}.reduce(0, :+)
end
assert_equal 23, fizzbuzz_sum(10)

puts fizzbuzz_sum(1000)
