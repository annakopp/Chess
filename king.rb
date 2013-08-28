class King < Piece
  DELTAS = [[1, 1], [-1, -1], [-1, 1], [1, -1],
            [0, 1], [0,  -1], [-1, 0], [1, 0]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2654 " : " \u265A " )
  end

  def find_possible_moves(board)
    possible_moves = []

    DELTAS.each do |delta|
      dx = delta[0]
      dy = delta[1]

      move = [(loc[0] + dx), (loc[1] + dy)]

      possible_moves << move if !out_of_bounds?(move) &&
        ((board[move[0]][move[1]]).nil? || edible?(move, board))
    end

    @possible_moves = possible_moves
  end
end