class Node
  attr_accessor :value, :connected_squares

  def initialize(value = nil, connected_squares = nil)
    @value = value
    @connected_squares = connected_squares
  end
end
