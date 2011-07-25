module BST
  class Node
    attr_accessor :value, :left, :right
    
    def initialize(value,nodes={})
      @value = value
      @left = nodes[:left]
      @right = nodes[:right]
    end
  end
end