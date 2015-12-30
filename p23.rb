require_relative "support/asserts"
require_relative "support/p21_divisors.rb"

def abundant?(number)
  divsum(number) > number
end
assert_true abundant?(12)
assert_false abundant?(11)

Abundants = Enumerator.new do |enum|
  n = 1
  loop do
    break if n > 28112
    enum.yield(n) if abundant?(n)
    n += 1
  end
end
p Abundants.take(100).map{|a| divisors(a)}
