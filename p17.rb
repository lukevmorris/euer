require_relative "support/asserts"

def word_bank(number)
  case number
  when 1 ; "one"
  when 2 ; "two"
  when 3 ; "three"
  when 4 ; "four"
  when 5 ; "five"
  when 6 ; "six"
  when 7 ; "seven"
  when 8 ; "eight"
  when 9 ; "nine"
  when 10 ; "ten"
  when 11 ; "eleven"
  when 12 ; "twelve"
  when 13 ; "thirteen"
  when 14 ; "fourteen"
  when 15 ; "fifteen"
  when 16 ; "sixteen"
  when 17 ; "seventeen"
  when 18 ; "eighteen"
  when 19 ; "nineteen"
  when 20 ; "twenty"
  when 30 ; "thirty"
  when 40 ; "forty"
  when 50 ; "fifty"
  when 60 ; "sixty"
  when 70 ; "seventy"
  when 80 ; "eighty"
  when 90 ; "ninety"
  end
end

def hundreds(digits)
  if digits[0] > 0
    count = word_bank(digits[0])
    "#{count}hundred"
  end
end

def tens(digits)
  if digits[1] > 1
    ten_word = word_bank(digits[1]*10)
    ten_word + ones(digits).to_s
  else
    number = digits[1..2].join("").to_i
    word_bank(number)
  end
end

def ones(digits)
  word_bank(digits[2]) if digits[2] > 0
end

def to_word(number)
  return "onethousand" if number == 1000
  digits = number.to_s.rjust(3,"0").split("").map(&:to_i)
  hundred_word = hundreds(digits)
  ten_word = tens(digits)
  if hundred_word && ten_word
    "#{hundred_word}and#{ten_word}"
  else
    "#{hundred_word}#{ten_word}"
  end
end
assert_equal "one", to_word(1)
assert_equal "two", to_word(2)
assert_equal "three", to_word(3)
assert_equal "four", to_word(4)
assert_equal "five", to_word(5)
assert_equal "fifteen", to_word(15)

assert_equal "twenty", to_word(20)
assert_equal "thirty", to_word(30)
assert_equal "forty", to_word(40)
assert_equal "ninety", to_word(90)

assert_equal "twentyone", to_word(21)
assert_equal "twentytwo", to_word(22)
assert_equal "thirtythree", to_word(33)
assert_equal "ninetyone", to_word(91)

assert_equal "onehundred", to_word(100)
assert_equal "onehundredandone", to_word(101)
assert_equal "onehundredandtwo", to_word(102)
assert_equal "onehundredandninetyone", to_word(191)

assert_equal "onethousand", to_word(1000)

p 1000.times.map { |x| to_word(x+1) }.join.size
