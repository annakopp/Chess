class Bishop < Piece
  DELTAS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2657 " : " \u265D " )
  end

  def possible_moves(board)
    possible_moves = []

    DELTAS.each do |delta|
      dx = delta[0]
      dy = delta[1]
      temp = [(loc[0] + dx), (loc[1] + dy)]

      until out_of_bounds?(temp) || !board[temp[0]][temp[1]].nil?

        possible_moves << temp
        temp = [(temp[0] + dx), (temp[1] + dy)]
      end
      p possible_moves
      possible_moves << temp if edible?(temp, board)

    end

    possible_moves
  end

  def edible?(pos, board)
    return false if out_of_bounds?(pos)
    !board[pos[0]][pos[1]].nil? && board[pos[0]][pos[1]].color != color
  end

  def out_of_bounds?(pos)
    !pos[0].between?(0,7) || !pos[1].between?(0,7)
  end

  # x+1, x+2, x+3...until x+i >7 or something is in the way

  def valid_move?(to, board)
    possible_moves(board).include?(to)
  end



end
