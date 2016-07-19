require 'byebug'

module Slideable

  def moves
    
    possible_moves = []

    move_dirs.each do |dir|
      possible_moves.concat(grow_unblocked_moves_in_dir(dir[0],dir[1]))
    end

    possible_moves
  end


  private

  def horizontal_dirs
    [[1,0],[0,1],[-1,0],[0,-1]]
  end

  def diagonal_dirs
    [[1,1],[-1,-1],[-1,1],[1,-1]]
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    # byebug
    moves = []
    invalid_move = false
    move = [@pos[0]+dx,@pos[1]+dy]

    while invalid_move == false
      if @board.in_bounds?(move)
        if @board[move].is_a?(NullPiece)
          moves << move.dup
        else
          moves << move.dup if @board[move].color != self.color
          invalid_move = true
        end
      else
        invalid_move = true
      end

      move[0] += dx
      move[1] += dy
    end
    moves
  end



end
