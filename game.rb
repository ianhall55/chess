require_relative 'display.rb'


class Game

  def initialize(display = Display.new)
    @display = display

  end

  def run
    while true
      @display.get_input
      # @display.move()
      @display.render
    end

  end

end

g = Game.new
g.run
