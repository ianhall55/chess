
require_relative 'display'



class HumanPlayer

  attr_accessor :name, :display, :color

  def initialize(name = 'John')
    @name = name
    @display = nil
    @color = nil
  end


  def play_turn
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    pos = result

  end


end
