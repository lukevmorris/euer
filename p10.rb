require_relative "support/asserts"
require_relative "support/p7_primes"

def primes_below(limit)
  Primes.take_while { |prime| p prime; prime <= limit }
end
assert_equal [2, 3], primes_below(3)
assert_equal [2, 3, 5, 7], primes_below(10)

assert_equal 17, primes_below(10).reduce(:+)

p primes_below(2_000_000).reduce(:+)
