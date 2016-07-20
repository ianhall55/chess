require 'byebug'
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

    valid = []
    valid = moves.reject do |move|
      
      move_into_check?(move)
    end
    valid
  end

  def symbol

  end

  private
  def move_into_check?(to_pos)

    original_pos = @pos
    board_dup = @board.dup_board

    x1,y1 = original_pos
    x2,y2 = to_pos

    board_dup[original_pos], board_dup[to_pos] = NullPiece.instance, board_dup[original_pos]

    @pos = to_pos
    check = board_dup.in_check?(@color)

    @pos = original_pos
    check
  end

end
