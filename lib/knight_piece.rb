require_relative 'board'

class Knight
  def knight_moves(start_square, end_square, board = Board.new, visited_squares = 0, array = [])
    find_start = board.find { |mini_square| start_square == mini_square.value }
    # find_end = board.find{|mini_square| end_square == mini_square.value}
    if start_square == end_square
      array.push(end_square)
      return array
    end
    next_vals = find_start.connected_squares
    visited_squares += 1
    array.push(start_square)
    var_array = []
    i = 0
    until i == 8
      next_val = next_vals[i]
      if !next_val.nil? && visited_squares != 10
        if start_square[0] < end_square[0]
          if start_square[0] <= next_val.value[0] && end_square[0] >= next_val.value[0]
            var_array.push(knight_moves(next_val.value, end_square, board,
                                        visited_squares))
          end
        elsif end_square[0] < start_square[0]
          if start_square[0] >= next_val.value[0] && end_square[0] <= next_val.value[0]
            var_array.push(knight_moves(next_val.value, end_square, board,
                                        visited_squares))
          end
        elsif start_square[1] < end_square[1]
          if start_square[1] <= next_val.value[1] && end_square[1] >= next_val.value[1]
            var_array.push(knight_moves(next_val.value, end_square, board,
                                        visited_squares))
          end
        elsif end_square[1] < start_square[1]
          if start_square[1] >= next_val.value[1] && end_square[1] <= next_val.value[1]
            var_array.push(knight_moves(next_val.value, end_square, board,
                                        visited_squares))
          end
        else
          var_array.push(knight_moves(next_val.value, end_square, board, visited_squares))
        end
      end
      i += 1
    end
    var_array.sort_by!(&:length)
    return array + var_array[0] unless var_array[0].nil?

    array
  end
end
