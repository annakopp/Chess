class King < Piece
  DELTAS = [[1, 1], [-1, -1], [-1, 1], [1, -1],
            [0, 1], [0,  -1], [-1, 0], [1, 0]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2654 " : " \u265A " )
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

    possible_moves.select! { |move| !scary_spots(game).include?(move) }

    @possible_moves = possible_moves
    nil
  end

  def scary_spots(game)
    scary_spots = []

    game.all_pieces.select { |piece| piece.color != color }.each do |piece|
      piece.possible_moves.each do |move|
        scary_spots << move
      end
    end

    scary_spots
  end

  def threatened?(game)
    scary_spots(game).include?(loc)
  end

end