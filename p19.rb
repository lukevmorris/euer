require_relative "support/asserts"

def leap?(year)
  (year % 4 == 0) && (year % 400 != 0)
end
assert_true leap?(1996)
assert_true leap?(1992)
assert_false leap?(400)
assert_false leap?(2000)
assert_false leap?(455)

def month_firsts(year)
  if leap?(year)
    [1, 32, 61, 92, 122, 153, 183, 214, 245, 275, 306, 336]
  else
    [1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335]
  end
end

def days_until(year)
  1902.upto(year).map { |year| leap?(year-1) ? 366 : 365 }.reduce(0, :+)
end
assert_equal 0, days_until(1901)
assert_equal 365, days_until(1902)
assert_equal 730, days_until(1903)
assert_equal 1095, days_until(1904)
assert_equal 1461, days_until(1905)

def first_day_index
  1901.upto(2000).flat_map do |yr|
    yr_relative = month_firsts(yr)
    days_before_yr = days_until(yr)
    yr_relative.map{|day| day+days_before_yr}
  end
end

# Jan 1, 1901 (index 1) was a Tuesday
# Then first sunday was index 6
# Monday is index 0
# So we're looking for (index - 1) % 7 == 0 for Tuesday
# index % 7 == 0 for Monday
# (index + 1) % 7 == 0 for Sunday
starttime = Time.now
first_day_index.select{|i| (i+1) % 7 == 0}.length
endtime = Time.now
p endtime-starttime

FirstIndexes = Enumerator.new do |enum|
  days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  m = 0
  index = 1
  loop do
    enum.yield(index)
    year, month = m.divmod(12)
    break if (year+1901) > 2000
    index += days[month]
    index += 1 if month > 0 && leap?(year)
    m += 1
  end
end
starttime = Time.now
FirstIndexes.select{|ind| (ind + 1) % 7 == 0}.size
endtime = Time.now
p endtime-starttime
