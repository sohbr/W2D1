class Piece
  attr_accessor :position, :value

  def initialize
    @position = nil
    @value = 'xx'
  end

end

class NullPiece < Piece

end
