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
