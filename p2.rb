require_relative "support/asserts"

def fibs(limit)
  seq = [1, 2]
  loop do
    succ = seq[-1] + seq[-2]
    break if succ > limit
    seq.push(succ)
  end
  seq
end
assert_equal [1, 2, 3, 5], fibs(5)
assert_equal [1, 2, 3, 5, 8], fibs(9)

def even_fibs(limit)
  fibs(limit).select(&:even?)
end
assert_equal [2], even_fibs(5)
assert_equal [2, 8], even_fibs(9)

p even_fibs(4_000_000).reduce(0, :+)
