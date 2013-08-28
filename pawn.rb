class Pawn < Piece

  DELTAS = [ [0, 1], [-1, 1], [1, 1] ]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2659 " : " \u265F " )
  end

  def find_possible_moves(board)
    possible_locations = []
    possible_moves = []

    DELTAS.each do |delta|
      possible_locations << [(loc[0] + delta[0]), (loc[1] + delta[1])]
    end

    in_front = possible_locations.shift
    possible_moves << in_front if board[in_front[0]][in_front[1]].nil?

    front_left = possible_locations.shift
    possible_moves << front_left if edible?(front_left, board)

    front_right = possible_locations.shift
    possible_moves << front_right if edible?(front_right, board)

    @possible_moves = possible_moves
  end

end