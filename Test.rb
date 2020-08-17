# frozen_string_literal: true

require_relative 'Node.rb'
require_relative 'BinaryTree.rb'

# driver script

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
full_list = Array.new(15) { rand(1..100) }
bst = Tree.new(full_list)
# 2. Confirm that the tree is balanced by calling `#balanced?`
puts bst.balanced?
# 3. Print out all elements in level, pre, post, and in order
puts "\n\n"
puts "Level order values are: "
puts bst.level_order
puts 'Preorder values are:'
bst.preorder
puts 'Postorder values are: '
bst.postorder
puts 'Inorder values are: '
bst.inorder
# 4. try to unbalance the tree by adding several numbers > 100
bst.inserting(5000)
bst.inserting(50001)
bst.inserting(50002)
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
puts bst.balanced?
# 6. Balance the tree by calling `#rebalance`
bst.rebalance
# 7. Confirm that the tree is balanced by calling `#balanced?`
puts bst.balanced?
# 8. Print out all elements in level, pre, post, and in order
puts "\n\n"
puts "Level order values are: "
puts bst.level_order
puts 'Preorder values are:'
bst.preorder
puts 'Postorder values are: '
bst.postorder
puts 'Inorder values are: '
bst.inorder
puts "\n\nIsn't she pretty?"
puts "\n\n"
bst.pretty_print
