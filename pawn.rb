class Pawn < Piece

  DELTAS = [ [0, 1], [-1, 1], [1, 1] ]

  def initialize(color, loc)
    super(color, loc)
    @token = "P"
  end

  def valid_move?(from, to, board)
    possible_locations = []
    DELTAS.each do |delta|
      possible_locations << [(from[0] + delta[0]), (from[1] + delta[1])]
    end

    if (to == possible_locations.first) && board[to[0]][to[1]].nil?
      return true
    elsif possible_locations.include?(to) && !board[to[0]][to[1]].nil?
      if board[to[0]][to[1]].color != self.color
        return true
      end
    end

    false
  end

end