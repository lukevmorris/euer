def prime?(number)
  sqrt = Math.sqrt(number)
  2.upto(sqrt).none?{|n| number % n == 0}
end

Primes = Enumerator.new do |enum|
  n = 2
  loop do
    enum.yield(n) if prime?(n)
    n += 1
  end
end
