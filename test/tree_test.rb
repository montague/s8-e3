require_relative 'test_helper'
class TreeTest < Test::Unit::TestCase
  def setup
    @tree = Tree.new(Node.new(1))
  end

  def test_create_a_tree
    assert @tree, "create a tree"
    assert @tree.root, "tree has a root"
    assert @tree.root.value, "root has a value"
  end
  
  def test_add_a_node
    assert_equal 1, @tree.size, "tree starts with one node"

    assert @tree.add(2), "can add a node"
    assert_equal 2, @tree.size, "add a node, tree grows"
  end
  
  def test_remove_a_node
    assert_equal 1, @tree.size, "tree starts with one node"
    assert !@tree.remove(1), "can't remove only node"
    @tree.add 2
    assert_equal 2, @tree.size, "add a node"
    assert @tree.remove(2), "can remove a node"
    assert_equal 1, @tree.size, "can remove if more than one node"
  end
  
end