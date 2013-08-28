

class Bishop < Piece
  DELTAS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2657 " : " \u265D " )
  end

  def find_possible_moves(game)
    possible_moves = []

    DELTAS.each do |delta|
      dx = delta[0]
      dy = delta[1]

      temp = [(loc[0] + dx), (loc[1] + dy)]

      until out_of_bounds?(temp) || !game.board[temp[0]][temp[1]].nil?

        possible_moves << temp
        temp = [(temp[0] + dx), (temp[1] + dy)]
      end

      possible_moves << temp if edible?(temp, game.board)

    end

    @possible_moves = possible_moves
    nil
  end


end
