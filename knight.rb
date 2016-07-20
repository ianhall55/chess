require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    '♞'.colorize(color)
  end

  protected
  def move_diffs
    knight_dirs
  end



end
