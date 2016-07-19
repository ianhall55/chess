class Piece

  attr_reader :color

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

  end

  def symbol

  end

  private
  def move_into_check?(to_pos)

  end

end
