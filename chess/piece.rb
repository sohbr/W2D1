require 'singleton'
require 'byebug'
class Piece
  attr_accessor :position, :value, :color

  def initialize(board)
    @position = nil
    @value = 'xx'
    @board = board
    @color = :black
  end

  def legal_move?(pos)
    @board.in_bounds?(pos) && (@board[pos].is_a?(NullPiece) || @board[pos].color != @color)
  end
end

module SlidingPiece
  def moves(start_pos)
    # debugger
    moves = []
    move_dirs.each do |dir|
      row, col = start_pos
      proj = [row + dir[0], col + dir[1]]
      while legal_move?(proj)
        moves << proj
        proj = [proj[0] + dir[0], proj[1] + dir[1]]
        break unless @board[proj].color == @color
      end
    end
    moves
  end

  def move_dirs(start_pos)
    raise NotImplementedError
  end

  def diagonal_dirs
    [ [-1, -1], [-1, 1], [1, 1], [1, -1] ]
  end

  def horizontal_dirs
    [ [1, 0], [-1, 0], [0, 1], [0, -1] ]
  end
end

class Bishop < Piece
  include SlidingPiece
  def move_dirs
    diagonal_dirs
  end
end

class Rook < Piece
  include SlidingPiece
  def move_dirs
    horizontal_dirs
  end
end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end

module SteppingPiece
  def move_diffs
    raise NotImplementedError
  end

  def moves(start_pos)
    moves = []
    row, col = start_pos
    move_diffs.each do |diff|
      proj = [row + diff[0], col + diff[1]]
      moves << proj if @board.valid_move?(proj)
    end
    moves
  end
end

class Knight < Piece
  include SteppingPiece
  def move_diffs
    [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end
end

class King < Piece
  include SteppingPiece
  def move_diffs
    [[1, 0], [-1, 0], [0, 1], [0, -1], [-1, -1], [-1, 1], [1, 1], [1, -1]]
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
  end
end
