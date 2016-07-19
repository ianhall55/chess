require 'colorize'
require 'byebug'
require_relative 'cursorable'
require_relative 'board'

class Display
  include Cursorable
  attr_reader :cursor, :selected, :board, :debug
  attr_accessor :message

  def initialize(board)
    @cursor_pos = [0,0]
    @notifications = Hash.new
    @selected = false
    @board = board
    @debug = true
    @message = 1
  end



  def move(new_pos)
    # byebug
    @cursor_pos = new_pos

  end

  def build_grid
   @board.rows.map.with_index do |row, i|
     build_row(row, i)
   end
 end

 def build_row(row, i)
   row.map.with_index do |piece, j|
     color_options = colors_for(i, j)
     color_options[:color] = piece.color
     piece.to_s.colorize(color_options)
   end
 end

 def colors_for(i, j)
   if [i, j] == @cursor_pos
     bg = :light_red
   elsif (i + j).odd?
     bg = :light_blue
   else
     bg = :blue
   end
   { background: bg}
 end

 def render
   system("clear")
   puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
   puts "Debugging" if @debug == true
   puts "Please select a piece." if @message == 1
   puts "Please choose a spot to place to your piece." if @message == 2
   build_grid.each { |row| puts row.join }
 end




end
