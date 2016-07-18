require_relative 'stepable'

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :k
  end


end
