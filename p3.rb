require_relative "support/asserts"

def primes(number)
  factors = []
  (2..number).each do |div|
    if number % div == 0
      number /= div
      factors << div
    end
    break if number == 1
  end
  factors
end
assert_equal [2], primes(2)
assert_equal [2, 3], primes(6)
assert_equal [5, 7, 13, 29], primes(13195)

p primes(600851475143).max
