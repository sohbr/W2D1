require_relative 'piece'
require_relative 'display'

# MAKE SURE THAT WHITE TOP BLACK BOTTOM

class Board
  attr_reader
  def initialize
    @grid = generate_grid
    set_positions
  end

  def generate_grid
    squares = []
    (0..63).each do |idx|
      if (0..15).include?(idx) || (48..63).include?(idx)
        squares << Piece.new(self)
      else
        squares << NullPiece.instance
      end
    end
    squares.each_slice(8).to_a
  end

  def set_positions
    @grid.each_with_index do |row, idx|
      row.each_with_index { |piece, idx2| piece.position = [idx, idx2] }
    end
  end


  def move_piece(start_pos, end_pos)
    raise ArgumentError.new('There is no piece here') unless has_piece?(start_pos)
    raise ArgumentError.new('Not a valid move') unless valid_move?(end_pos)
    self[start_pos].position = end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def has_piece?(pos)
    self[pos].class == Piece
  end

  def valid_move?(pos)
    self[pos].class == NullPiece
  end

  def in_bounds?(pos)
    row, col = pos
    (0..7).include?(row) && (0..7).include?(col)
  end


end
