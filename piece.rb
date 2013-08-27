class Piece
  attr_reader :color, :token

  def initialize(color)
    @color = color
    @token = "?"
  end

  def move(move_from, move_to, board)
    #move from and move to
    #not sure if needed in this parent class
    if valid_move?(move_from, move_to, board)
      move_to.piece = self
      move_from.piece = nil
    end
  end

  def valid_move?
    false
  end



end