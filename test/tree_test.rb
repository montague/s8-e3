require_relative 'test_helper'
class TreeTest < Test::Unit::TestCase
  def setup
    @tree = Tree.new(1)
  end

  def big_tree ary
    tree = nil
    ary.each do |i|
      tree.nil? ? tree = Tree.new(i) : tree.add(i)
    end
    tree
  end
  
  def test_add_a_value
    assert_equal 1, @tree.size, "tree starts with one value"
    assert @tree.add(2), "can add a value"
    assert_equal 2, @tree.size, "add a value, tree grows"
  end
  
  def test_remove_a_leaf_node
    assert_equal 1, @tree.size, "tree starts with one value"
    assert !@tree.remove(1), "can't remove only value"
    @tree.add 2
    assert @tree.remove(2), "can remove a value"
    assert_equal 1, @tree.size, "can remove if more than one value"
  end
  
  def test_remove_a_node_with_one_child
    ary = [10,7,4,9,12,11,15,16]
    tree = big_tree ary
    
    assert tree.remove(15)
    assert_equal ary.size-1, tree.size
    assert_equal "4,7,9,10,11,12,16", tree.to_s, "removing a node with children should preserve bst properties"
  end
  
  def test_remove_a_node_with_two_children
    ary = [10,7,4,9,12,11,15]
    tree = big_tree ary
    
    assert tree.remove(10)
    assert_equal ary.size-1, tree.size
    assert_equal "4,7,9,11,12,15", tree.to_s, "removing a node with children should preserve bst properties"
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
    ary = [10,7,4,9,12,11,15]
    tree = big_tree ary

    assert_equal ary.sort.join(','), tree.to_s, "Should print in order"
    
    assert_equal ary.sort.reverse.join(','), tree.to_s_reverse, "Should print in reverse order"
  end
  
end
