require_relative 'display.rb'


class Game
   attr_reader :display

  def initialize(display = Display.new)
    @display = display

  end

  def run

    move_number = 1
    piece = nil
    available_moves = nil

    while true
      result = nil
      until result
        @display.render
        result = @display.get_input
      end
      pos = result

      if move_number == 1
        piece = display.board[pos]
        available_moves = piece.moves
        # p available_moves
        move_number = 2
      else
        # puts "can't move there" unless available_moves.include?(pos)
        # puts "nice" if available_moves.include?(pos)
        move_number = 1
      end

    end
  end

  # def available_moves?(pos)
  #   piece = display.board[pos]
  #   available_moves = piece.moves
  # end


end

g = Game.new
g.run
