require_relative 'array'

class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    return " #{symbol} "
  end

  def empty?
    false
  end

  def valid_moves
    moves.reject do |move|
      # byebug
      move_into_check?(move)
    end
  end

  def symbol

  end

  private
  def move_into_check?(to_pos)
    original_pos = @pos
    board_dup = Board.new
    rows_dup = @board.rows.deep_dup
    board_dup.rows = rows_dup

    x1,y1 = original_pos
    x2,y2 = to_pos
    # board_dup[x1][y1], board_dup[x2][y2] = NullPiece.instance, board_dup[x1][y1]
    board_dup[original_pos], board_dup[to_pos] = NullPiece.instance, board_dup[original_pos]

    @pos = to_pos
    check = board_dup.in_check?(color)
    @pos = original_pos
    check
  end

end
