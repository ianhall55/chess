require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :k
  end

  protected
  def move_diffs
    knight_dirs
  end



end
