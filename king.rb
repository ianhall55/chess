require_relative 'stepable'

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :K
  end


end
