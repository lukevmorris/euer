require_relative "support/asserts"

def divisors(number)
  return [] if number == 1
  (1...number).select{|n| number % n == 0}
end
assert_equal [], divisors(1)
assert_equal [1], divisors(2)
assert_equal [1,2,3], divisors(6)
assert_equal [1,2,4,5,10,11,20,22,44,55,110], divisors(220)

def divsum(number)
  divisors(number).reduce(0, :+)
end
assert_equal 0, divsum(1)
assert_equal 6, divsum(6)
assert_equal 284, divsum(220)

def amicable?(number)
  divsum(number) != number && divsum(divsum(number)) == number
end
assert_true amicable?(220)
assert_true amicable?(284)

Amicables = Enumerator.new do |enum|
  n = 1
  loop do
    enum.yield(n) if amicable?(n)
    n += 1
  end
end

p Amicables.take_while{|n| n < 10000}.reduce(:+)
