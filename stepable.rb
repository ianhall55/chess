module Stepable

  def moves
    moves = []

    move_diffs.each do |dir|

      dx, dy = dir[0], dir[1]
      move = [@pos[0]+dx,@pos[1]+dy]

      if @board.in_bounds?(move)
        if @board[move].is_a?(NullPiece)
          moves << move
        elsif @board[move].color != self.color
          # puts 'nope'
          moves << move
        end
      end

    end

    moves
  end


  private

  def horizontal_dirs
    [[1,0],[0,1],[-1,0],[0,-1]]
  end

  def diagonal_dirs
    [[1,1],[-1,-1],[-1,1],[1,-1]]
  end

  def knight_dirs
    [[-1,-2],[-2,-1],[-1,2],[-2,1],
    [1,2],[1,-2],[2,-1],[2,1]]
  end

end
