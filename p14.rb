require_relative "support/asserts"

CltzTbl = {}
class Collatz
  attr_reader :start
  def initialize(start)
    @start = start
  end

  def length
    return 1 if start == 1
    if stored = CltzTbl[start]
      stored
    else
      calcd = succ.length + 1
      CltzTbl[start] = calcd
    end
  end

  def succ
    next_start = (start.odd? ? (3*start+1) : (start/2))
    Collatz.new(next_start)
  end
end
assert_equal 1, Collatz.new(1).length
assert_equal 2, Collatz.new(2).length
assert_equal 3, Collatz.new(4).length
assert_equal 17, Collatz.new(7).length

1_000_000.times.map{|n| Collatz.new(n+1).length}
p CltzTbl.max{|a,b| a[1] <=> b[1]}[0]
