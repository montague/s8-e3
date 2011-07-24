module BST
  class Node
    attr_accessor :value, :parent, :left, :right
    
    def initialize(value,nodes={})
      @value = value
      @left = nodes[:left]
      @right = nodes[:right]
      @parent = nodes[:parent]
    end
  end
end