class Knight < Piece
  DELTAS = [[1,   2], [2,   1], [2, -1], [1, -2],
            [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2658 " : " \u265E " )
  end

  def find_possible_moves(game)
    possible_moves = []

    DELTAS.each do |delta|
      dx = delta[0]
      dy = delta[1]

      move = [(loc[0] + dx), (loc[1] + dy)]

      possible_moves << move if !out_of_bounds?(move) &&
        ((game.board[move[0]][move[1]]).nil? || edible?(move, game.board))
    end

    @possible_moves = possible_moves
    nil
  end


end
