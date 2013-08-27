class Rook < Piece
  DELTAS = [[0, 1], [0, -1], [-1, 0], [1, 0]]

  def initialize(color, loc)
    super(color, loc)
    @token = "R"
  end

  def possible_moves(board)
    possible_moves = []

    DELTAS.each do |delta|
      dx = delta[0]
      dy = delta[1]
      temp = loc.dup

      until out_of_bounds?(temp) || !board[temp[0]][temp[1]].nil?
        possible_moves << temp
        temp = [(temp[0] + dx), (temp[1] + dy)]
      end

      possible_moves << temp if edible?(temp, board)

    end

    possible_moves
  end

  def edible?(loc, board)
    !board[loc[0]][loc[1]].nil? && board[loc[0]][loc[1]].color != color
  end

  def out_of_bounds?(loc)
    !loc[0].between?(0,7) || !loc[1].between?(0,7)
  end

  # x+1, x+2, x+3...until x+i >7 or something is in the way

  def valid_move?(to, board)
    possible_moves(board).include?(to)
  end



end
