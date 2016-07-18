require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'null_piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate
  end

  def [](pos)
    x,y = pos
    rows[x][y]
  end

  def []=(pos,value)
    x,y = pos
    rows[x][y] = value
  end

  def move(start_pos,end_pos)

    begin
      piece = rows[start_pos]
    rescue
      raise if piece == nil || in_bounds?(end_pos) || end_pos == start_pos #change to nullpiece
      retry
    end
    rows[start_pos], rows[end_pos] = rows[end_pos], rows[start_pos]

  end

  def in_bounds?(new_pos)
    new_pos.first.between?(0, 7) && new_pos.last.between?(0, 7)
  end

  private

  def populate
    rows.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        pos = [i,j]
        case i
        when 0
          case j
          when 0, 7
            self[pos] = Rook.new(:black, self, pos)
          when 1, 6
            self[pos] = Knight.new(:black, self, pos)
          when 2,5
            self[pos] = Bishop.new(:black, self, pos)
          when 3
            self[pos] = Queen.new(:black, self, pos)
          when 4
            self[pos] = King.new(:black, self, pos)
          end
        when 1
          (0..7).each { |idx| self[[i,idx]] = Pawn.new(:black,self,[i,idx]) }
        when 7
          case j
          when 0, 7
            self[pos] = Rook.new(:white, self, pos)
          when 1, 6
            self[pos] = Knight.new(:white, self, pos)
          when 2,5
            self[pos] = Bishop.new(:white, self, pos)
          when 3
            self[pos] = Queen.new(:white, self, pos)
          when 4
            self[pos] = King.new(:white, self, pos)
          end
        when 6
          (0..7).each { |idx| self[[i,idx]] = Pawn.new(:white,self,[i,idx]) }
        when 2,3,4,5
          null = NullPiece.instance
          (0..7).each { |idx| self[[i,idx]] = null }
        end
      end
    end
  end

  def create_pieces(color)
    pieces = []
    [[]].each do |ps|
      pieces << Pawn.new(color, self, ps)
    end
    pieces
  end





end
