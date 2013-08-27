class Pawn < Piece

  DELTAS = [ [0, 1], [-1, 1], [1, 1] ]

  def initialize(color)
    super(color)
  end

  def valid_move?(move_from, move_to, board) # move_from, _to are Tiles
    possible_locations = []
    DELTAS.each do |delta|
      possible_locations << [ (move_from.x + delta[0]),
                            (move_from.y + delta[1]) ]
    end

    possible_tiles = possible_locations.map { |location|  board[location[0]][location[1]]}


    if (move_to == possible_tiles.first) && move_to.piece.nil?
      return true
    elsif possible_tiles.include?(move_to) && !move_to.piece.nil?
      if move_to.piece.color != self.color
        return true
      end
    end

    false
  end

end