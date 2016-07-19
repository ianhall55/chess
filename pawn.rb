require_relative 'piece'

class Pawn < Piece
  def initialize(color, board, pos)
    super
  end


  def symbol
    :p
  end

  def moves

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
      pos_m = [[pos[0], pos[1] + self.forward_dir], [pos[0], pos[1] + (self.forward_dir * 2)]]
      moves = pos_m.select {|move| @board[move].is_a?(NullPiece)}
    end

    moves
  end

  def side_attacks

  end


end
