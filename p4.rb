require_relative "support/asserts"

def pd?(number)
  number.to_s == number.to_s.reverse
end
assert_true pd?(1)
assert_true pd?(11)
assert_true pd?(111)
assert_true pd?(101)
assert_true pd?(9009)

pds = []

(100..999).each do |first|
  (100..999).each do |second|
    number = first * second
    pds << number if pd?(number)
  end
end

puts pds.max
