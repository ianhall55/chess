require_relative 'piece'

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
    rows.map! do |row|
      row.map! {|spot| spot = Piece.new}
    end

  end





end
