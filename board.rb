require 'byebug'
require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'null_piece'
require_relative 'array'

class Board
  attr_accessor :rows

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
    # byebug
    piece = self[start_pos]
    raise "Invalid move" unless piece.valid_moves.include?(end_pos)
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
    piece.pos = end_pos
  end

  def in_bounds?(new_pos)
    new_pos.first.between?(0, 7) && new_pos.last.between?(0, 7)
  end

  def in_check?(color)
    king_pos = nil

    board_dup = @rows.deep_dup.flatten

    board_dup.each do |piece|
      king_pos = piece.pos if piece.color == color && piece.class == King
    end

    other_color_pieces = board_dup.select do |piece|
       piece.color != color && piece.class != NullPiece
    end

    other_color_pieces.each do |piece|
      return true if piece.moves.include?(king_pos)
    end

    false
  end

  def checkmate?(color)
    pieces = player_pieces(color)
    if in_check?(color) && pieces.all? {|piece| piece.valid_moves == [] }
      return true
    end
    false
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

  # def deep_dup(ary)
  #   ary.map {|e| e.is_a?(Array) ? deep_dup(e) : e}
  # end

  def player_pieces(color)
    board_dup = rows.deep_dup.flatten
    board_dup.select do |piece|
      piece.color == color
    end
  end


end
