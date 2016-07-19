require 'byebug'
require_relative 'piece'
require_relative 'board'

class Pawn < Piece
  def initialize(color, board, pos)
    super
  end


  def symbol
    :p
  end

  def moves
    forward_steps + side_attacks
  end

  protected


  def at_start_row?
    if self.color == :black
      pos[0] == 1
    else
      pos[0] == 6
    end
  end

  def forward_dir
    if self.color == :black
      1
    else
      -1
    end
  end

  def forward_steps
    moves = []

    if self.at_start_row?
      pos_m = [[pos[0] + self.forward_dir, pos[1]], [pos[0] + (self.forward_dir * 2), pos[1]]]
      moves = pos_m.select {|move| @board[move].is_a?(NullPiece)}
    end

    moves
  end

  def side_attacks
    # byebug
    pos_m = [[pos[0] + self.forward_dir, pos[1] + 1],[pos[0] + self.forward_dir, pos[1] - 1 ]]
    pos_m = pos_m.select {|move| move[0].between?(0,7) && move[1].between?(0,7)}
    moves = pos_m.select do |move|
      !@board[move].is_a?(NullPiece) && @board[move].color != self.color
    end
    moves
  end


end
