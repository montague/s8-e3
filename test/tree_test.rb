require_relative 'test_helper'
class TreeTest < Test::Unit::TestCase
  def setup
    @tree = Tree.new(1)
  end

  def test_create_a_tree
    assert @tree, "create a tree"
    assert @tree.root, "tree has a root"
    assert @tree.root.value, "root has a value"
  end
  
  def test_add_a_node
    assert_equal 1, @tree.size, "tree starts with one node"
    assert @tree.add(2), "can add a value"
    assert_equal 2, @tree.size, "add a value, tree grows"
  end
  
  def test_remove_a_node
    assert_equal 1, @tree.size, "tree starts with one value"
    assert !@tree.remove(1), "can't remove only value"
    @tree.add 2
    assert @tree.remove(2), "can remove a value"
    assert_equal 1, @tree.size, "can remove if more than one value"
  end
  
  def test_contains_method
    assert @tree.contains?(1), "should contain setup value"
    assert !@tree.contains?(2), "should not contain a value before it's added"
    @tree.add(2)
    assert @tree.contains?(2), "should contain a value after it's added"
    @tree.remove(2)
    assert !@tree.contains?(2), "should not contain a value after it's removed"
  end
  
  
  def test_to_s_methods
    tree = Tree.new(10)
    ary = [10,7,4,9,12,11,15]
    ary.each do |i|
      tree.add(i)
    end
    assert_equal ary.sort.join(','), tree.to_s, "Should print in order"
    
    assert_equal ary.sort.reverse.join(','), tree.to_s_reverse, "Should print in reverse order"
  end
  
end
