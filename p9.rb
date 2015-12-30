require_relative "support/asserts"
# a < b < c
# a^2 + b^2 = c^2
# a + b + c = 1000
# c = 1000 - a - b

def c(a,b)
  Math.sqrt(a**2 + b**2)
end

def pythagorean?(a, b)
  c(a,b) % 1 == 0
end
assert_true pythagorean?(3, 4)
assert_false pythagorean?(4, 5)
assert_true pythagorean?(5, 12)

pythagoreans = Enumerator.new do |enum|
  b = 2
  loop do
    (1...b).each do |a|
      enum.yield [a, b, c(a,b).to_i] if pythagorean?(a,b)
    end
    b += 1
  end
end
assert_equal [3, 4, 5], pythagoreans.first
assert_equal [6, 8, 10], pythagoreans.take(2).last

p pythagoreans.find { |triple| triple.reduce(:+) == 1000 }.reduce(:*)
