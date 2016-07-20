require_relative 'stepable'

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    '♚'.colorize(color)
  end

  protected
  def move_diffs
    horizontal_dirs + diagonal_dirs
  end

end
