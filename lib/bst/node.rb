module BST
  class Node
    attr_accessor :value, :parent, :left, :right
    
    def initialize(value,nodes={})
      @value = value
      @left_child = nodes[:left]
      @right_child = nodes[:right]
      @parent = nodes[:parent]
    end
  end
end