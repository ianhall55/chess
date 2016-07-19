require_relative 'array'

class Piece

  attr_reader :color, :pos, :board

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
    moves.reject {|move| move_into_check?(move) }
  end

  def symbol

  end

  private
  def move_into_check?(to_pos)
    original_pos = @pos
    board_dup = @board.rows.deep_dup

    board_dup[@pos], board_dup[to_pos] = NullPiece.instance, board_dup[@pos]

    @pos = to_pos
    check? = board_dup.in_check?(color)
    @pos = original_pos
    check?
  end

end
