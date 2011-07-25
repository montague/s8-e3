module BST
  class Tree
    attr_reader :root, :size

    def initialize value
      @root = Node.new(value)
      @size = 1
    end

    def add value
      current = @root
      while true
        return if current.value == value
        if current.value > value
          if current.left.nil?
            current.left = Node.new(value)
            break
          end
          current = current.left
        else
          if current.right.nil?
            current.right = Node.new(value)
            break
          end
          current = current.right
        end
      end      
      @size += 1
    end

    def remove value
      return false if @size == 1 && @root.value == value
      current = @root
      parent = nil
      while true
        if current.value == value
          parent.left === current ? @parent.left = nil : parent.right = nil
          @size -= 1
          break
        end
        if current.value > value
          if current.left.nil?
            break
          else
            parent = current
            current = current.left
          end
        else
          if current.right.nil?
            break
          else
            parent = current
            current = current.right
          end
        end
      end
      true
    end

    def contains? value
      current = @root
      while true
        return true if current.value == value
        if current.value > value
          if current.left.nil?
            return false
          else
            current = current.left
          end
        else
          if current.right.nil?
            return false
          else
            current = current.right
          end
        end
      end
    end

    def to_s #defaults to in-order traversal
      ary = []
      in_order_traversal @root, ary
      ary.join(',')
    end
    
    def to_s_reverse
      ary = []
      reverse_order_traversal @root, ary
      ary.join(',')
    end
   
    def reverse_order_traversal node, ary
      if node.right
        reverse_order_traversal(node.right,ary)
      end
      ary << node.value
      if node.left
        reverse_order_traversal(node.left,ary)
      end
    end
    
    def in_order_traversal node, ary
      if node.left
        in_order_traversal(node.left,ary)
      end
      ary << node.value
      if node.right
        in_order_traversal(node.right,ary)
      end
    end

  end
end
