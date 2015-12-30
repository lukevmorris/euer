require_relative "support/asserts"
require_relative "support/p18_trees"

class Tree
  attr_reader :rows
  def initialize(rows)
    @rows = rows
  end

  def reduce
    return rows[0][0] if rows.length == 1
    ultimate = rows[-1]
    penultimate = rows[-2]
    new_ultimate = penultimate.map.with_index do |num, index|
      left = ultimate[index]
      right = ultimate[index+1]
      [left+num, right+num].max
    end
    new_rows = rows[0..-3] << new_ultimate
    Tree.new(new_rows)
  end
end
tree = Tree.new([[1], [2,2]])
assert_equal [1], tree.rows.first
assert_equal [2,2], tree.rows.last

tree = Tree.new([[1], [2,2], [3,3,3]]).reduce
assert_equal [1], tree.rows.first
assert_equal [5,5], tree.rows.last

tree = Tree.new([[1]])
assert_equal 1, tree.reduce

def reduce_tree(rows)
  tree = Tree.new(rows)
  tree = tree.reduce while tree.is_a?(Tree)
  tree
end
assert_equal 1, reduce_tree([[1]])
assert_equal 3, reduce_tree([[1],[2,2]])

tree_one = ONE.map{|row| row.map(&:to_i)}
assert_equal 23, reduce_tree(tree_one)

tree_two = TWO.map{|row| row.map(&:to_i)}
p reduce_tree(tree_two)
