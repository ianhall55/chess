require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :B
  end

  protected
  def move_dirs
    diagonal_dirs
  end

end
