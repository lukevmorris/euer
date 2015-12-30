require_relative "support/asserts"

def primes(number)
  (2..number).each_with_object(Hash.new(0)) do |n, factors|
    if number % n == 0
      number /= n
      factors[n] += 1
      number == 1 ? (break factors) : redo
    end
  end
end
assert_equal({2 => 1}, primes(2))
assert_equal({3 => 1}, primes(3))
assert_equal({2 => 2}, primes(4))
assert_equal({5 => 1}, primes(5))
assert_equal({2 => 1, 3 => 1}, primes(6))

def lcm(*numbers)
  prime_hashes = numbers.map{|n| primes(n)}
  prime_factors = prime_hashes.reduce({}) do |factors, hash|
    factors.merge(hash) { |k, v1, v2| [v1, v2].max }
  end
  prime_factors.reduce(1) { |pi, (k,v)| pi * k**v }
end
assert_equal 2, lcm(2, 2)
assert_equal 3, lcm(3, 3)
assert_equal 6, lcm(2, 3)
assert_equal 4, lcm(2, 4)
assert_equal 12, lcm(3, 4)
assert_equal 12, lcm(2, 3, 4)
assert_equal 2520, lcm(*1..10)

p lcm(*1..20)
