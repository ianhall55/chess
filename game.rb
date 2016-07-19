require 'byebug'
require_relative 'display.rb'
require_relative 'human_player.rb'
require_relative 'board'
require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'queen'
require_relative 'null_piece'
require_relative 'array'


class Game
   attr_accessor :board, :display, :player_one, :player_two, :turn

  def initialize(player_one, player_two)
    @board = Board.new
    @display = Display.new(@board)
    @player_one = player_one
    @player_two = player_two
    player_one.color = :white
    player_two.color = :black
    player_one.display = display
    player_two.display = display
    @turn = player_one
  end

  def play

    while !@board.checkmate?(@turn.color)
      begin
        pos1 = turn.play_turn
        display.message = 2

        pos2 = turn.play_turn
        display.message = 1

        @board.move(pos1,pos2)
      rescue
        # display.debug = true
        retry
      end
      swap_turn
    end

  end

  def swap_turn
    turn = (turn == player_one) ? player_two : player_one
  end

end

# byebug
player1 = HumanPlayer.new
player2 = HumanPlayer.new
g = Game.new(player1, player2)
g.play
