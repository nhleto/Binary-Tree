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

  def inserting(value, root  = @root)
    node = Node.new(value)
    if root.nil?
      root = node
    else
      if root.data < node.data
        if root.right.nil?
          root.right = node
        else
          inserting(value, root)
        end
      else
        if root.left.nil?
          root.left = node
        else
          root.left = node
        end
      end
    end
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

full_list = [0, 30, 32, 34, 36, 40, 50, 60, 65, 70, 75, 80, 85]
bst = Tree.new(full_list)
bst.inserting(51)
bst.display
