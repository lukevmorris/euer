require_relative "support/asserts"

def worth(name)
  base = "A".ord - 1
  name.each_char.map{|chr| chr.ord - base}.reduce(:+)
end
assert_equal 53, worth("COLIN")

raw_names = File.read("support/p22_names.txt")
sorted_names = raw_names.gsub("\"","").strip.split(",").sort
scores = sorted_names.map.with_index{|name, index| worth(name) * (index + 1)}
p scores.reduce(:+)
