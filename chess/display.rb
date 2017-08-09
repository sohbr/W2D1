require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
    @last_selected_pos = nil
    @selected = false
  end

  def render


    (0..7).each do |row|
      (0..7).each do |col|
        if @cursor.selected && @last_selected_pos == [row,col]
          print "#{@board[[row, col]].value}  ".colorize(:yellow)
        elsif @cursor.cursor_pos == [row,col]
          print "#{@board[[row, col]].value}  ".colorize(:blue)
        else
          print "#{@board[[row, col]].value}  ".colorize(:red)
        end
      end
      puts
      puts
    end


  end

  def cursor_test
    while true
      begin
      system('clear')
      render
      selection = @cursor.get_input
      @last_selected_pos = selection if selection
      rescue
        retry
      end
    end

  end

end

# load 'board.rb'
# load 'display.rb'
# load 'cursor.rb'
# load 'piece.rb'
