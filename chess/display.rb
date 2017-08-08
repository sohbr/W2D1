require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    (0..7).each do |row|
      (0..7).each do |col|
        print "#{@board[[row, col]].value}  "
      end
      puts
      puts
    end
  end

end
