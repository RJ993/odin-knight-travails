require_relative 'node_class'

class Board
  attr_accessor :squares

  def initialize
    @squares = create_board
    connect_squares
  end

  def create_board
    board = []
    x = 0
    y = 0
    8.times do
      8.times do
        node = Node.new([x, y], [])
        board.push(node)
        y += 1
      end
      x += 1
      y = 0
    end
    board
  end

  def connect_squares
    squares.each do |square|
      connected_node = squares.find { |mini_square| [square.value[0] - 2, square.value[1] - 1] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] - 2, square.value[1] + 1] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] - 1, square.value[1] - 2] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] - 1, square.value[1] + 2] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] + 1, square.value[1] + 2] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] + 1, square.value[1] - 2] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] + 2, square.value[1] + 1] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
      connected_node = squares.find { |mini_square| [square.value[0] + 2, square.value[1] - 1] == mini_square.value }
      square.connected_squares.push(connected_node) unless connected_node.nil?
    end
  end
end
