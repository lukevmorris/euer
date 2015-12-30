require_relative "support/asserts"

def prime?(number)
  sqrt = Math.sqrt(number)
  2.upto(sqrt).none?{|n| number % n == 0}
end
assert_true prime?(2)
assert_true prime?(3)
assert_true prime?(5)
assert_false prime?(4)
assert_false prime?(6)

primes = Enumerator.new do |enum|
  n = 2
  loop do
    enum.yield(n) if prime?(n)
    n += 1
  end
end
assert_equal [2, 3], primes.take(2)
assert_equal [2, 3, 5], primes.take(3)
assert_equal 13, primes.take(6).last

p primes.take(10_001).last
