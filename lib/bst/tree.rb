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
        if current.value == value #found the value to remove
          # three possibilities
          if current.left && current.right # two children
            # find next biggest value or next smallest value. copy that value into node. 
            # delete the node that contained the next biggest value
            # to keep tree reasonably balanced, flip a coin to choose.
            replacement = Time.now.to_i.even? ? min_under_node(current) : max_under_node(current)
            new_value = replacement.value
            remove new_value
            current.value = new_value
          elsif child = (current.left || current.right) # one child
            parent.left == current ? parent.left = child : parent.right = child
            @size -= 1
          else #no children
            parent.left == current ? parent.left = nil : parent.right = nil
            @size -= 1
          end
          break
        end
        # traversal code
        side = current.value > value ? :left : :right
        break if current.send(side).nil?
        parent = current
        current = current.send(side)
      end
      true
    end

    def contains? value
      current = @root
      while true
        return true if current.value == value
        side = current.value > value ? :left : :right
        return false if current.send(side).nil?
        current = current.send(side)
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

    private

    # get node with smallest value of right subtree
    def min_under_node node
      current = node.right
      while current.left
        current = current.left
      end
      current
    end

    # get node with greatest value of left subtree
    def max_under_node node
      current = node.left
      while current.right
        current = current.right
      end
      current
    end
  end
end
