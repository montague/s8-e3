# BST

From [wikipedia](http://en.wikipedia.org/wiki/Binary_search_tree):
    
    In computer science, a binary search tree (BST), which may sometimes also 
    be called an ordered or sorted binary tree, is a node-based binary tree 
    data structure which has the following properties:
    
    1) The left subtree of a node contains only nodes with keys less than the 
    node's key.
    
    2) The right subtree of a node contains only nodes with keys greater than 
    the node's key.
    
    3) Both the left and right subtrees must also be binary search trees.
    
    The major advantage of binary search trees over other data structures is 
    that the related sorting algorithms and search algorithms such as in-order 
    traversal can be very efficient.
    Binary search trees are a fundamental data structure used to construct more
     abstract data structures such as sets, multisets, and associative arrays.

The BST library implements a simple binary search tree. A tree can be created as follows:

    tree = Tree.new(1) #note an initial value is required to create a tree

After the tree has been created, there are several operations that can be performed on it:

    tree.add(4) #add a new value
    tree.remove(4) #remove a value
    tree.contains?(4) # => false 
  
Additionally, the BST::Tree object has two different traversal methods that are used to return a string representing the entire tree in order and in reverse order.

    puts tree.to_s #prints out the tree in-order, from smallest value to largest
    puts tree.to_s_reverse #prints out the entire tree in reverse order, from largest to smallest
    
The cool thing about the traversal algorithms are how simple they are and how easily they lend themselves to recursion. Below is the in_order_traversal method definition:
    
    def in_order_traversal node, ary
      if node.left
        in_order_traversal(node.left,ary) #traverse left subtree (look at elements smaller than root of current subtree)
      end
      ary << node.value # add root of current subtree to our array
      if node.right
        in_order_traversal(node.right,ary) #traverse right subtree (look at elements larger than root of current subtree)
      end
    end
