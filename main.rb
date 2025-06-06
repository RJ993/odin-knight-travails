require_relative 'lib/board'
require_relative 'lib/node_class'
require_relative 'lib/knight_piece'

knight = Knight.new

board = Board.new

new_board = board.squares

p knight.knight_moves([0, 7], [1, 7], new_board)