module BST
  class Tree
    attr_reader :root, :size
    
    def initialize root
      @root = root
      @size = 1
    end
    
    def add value
      @size += 1
    end
    
    def remove value
      return false if @size == 1 && @root.value == value
      @size -= 1
    end
    
    def contains? value
    end
    
    def to_s
      
    end
  end
end
