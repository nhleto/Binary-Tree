# frozen_string_literal: true

# define node structure / data storage
class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# binary search tree initialization
class Tree
  def initialize(array)
    @sorted_array = array.sort.uniq unless array.nil?
    @root = build_tree(@sorted_array)
  end

  def build_tree(array)
    return nil if array.length.zero?

    return Node.new(array[0]) if array.length == 1

    mid = (array.length / 2)
    node = Node.new(array[mid])

    node.left = build_tree(array[0..mid - 1])
    node.right = build_tree(array[mid + 1..-1])
    node
  end

  def inserting(value, root = @root)
    node = Node.new(value)
    if root.nil?
      root = node
    else
      if root.data < node.data
        if root.right.nil?
          root.right = node
        else
          inserting(value, root.right)
        end
      else
        if root.left.nil?
          root.left = node
        else
          inserting(value, root.left)
        end
      end
    end
  end

  def min_value_node(root)
    return if root.nil?

    return min_value_node(root.right) unless root.right.nil?

    root
  end

  def deleting(value, root = @root)
    return if root.nil?

    if value < root.data
      root.left = deleting(value, root.left)
    elsif value > root.data
      root.right = deleting(value, root.right)
    elsif root.left.nil? && root.right.nil?
      root = nil
    elsif root.left.nil?
      root = root.right
    elsif root.right.nil?
      root = root.left
    else
      temp = min_value_node(root.left)
      root.data = temp.data
      root.left = deleting(temp.data, root.left)
    end
    root
  end

  def find(value, root = @root)
    return root if root.nil? || root.data == value

    root.data < value ? find(value, root.right) : find(value, root.left)
  end

  def level_order(root = @root)
    return if root.nil?

    queue = []
    output = []
    queue << root
    until queue.empty?
      current = queue.shift
      if current.left
        queue << current.left
      end
      if current.right
        queue << current.right
      end
      output << current.data
    end
    puts "Breadth traversal output: #{output}"
  end

  def display
    build_tree(@sorted_array)
    pretty_print
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│ ' : ' '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? ' ' : '│ '}", true) if node.left
  end
end
full_list = [5,6,2,4,1,8,7,9,3]
bst = Tree.new(full_list)
bst.level_order
# bst.display
