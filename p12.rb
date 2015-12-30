require_relative "support/asserts"

Triangles = Enumerator.new do |enum|
  n = 1
  loop do
    enum.yield 1.upto(n).reduce(:+)
    n += 1
  end
end
assert_equal 1, Triangles.take(1).last
assert_equal 3, Triangles.take(2).last
assert_equal 6, Triangles.take(3).last
assert_equal 10, Triangles.take(4).last

def all_factors(number)
  return [1] if number == 1
  sqrt = Math.sqrt(number)
  1.upto(sqrt).reduce([]) do |divisors, n|
    divisors += [n, number/n] if number % n == 0
    divisors
  end.sort
end
assert_equal [1], all_factors(1)
assert_equal [1, 2], all_factors(2)
assert_equal [1, 3], all_factors(3)
assert_equal [1, 2, 3, 6], all_factors(6)

p Triangles.detect { |tri| all_factors(tri).length > 500 }
