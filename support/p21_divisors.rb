def divisors(number)
  return [] if number == 1
  (1...number).select{|n| number % n == 0}
end

def divsum(number)
  divisors(number).reduce(0, :+)
end
