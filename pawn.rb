class Pawn < Piece

  WHITE_DELTAS = [[0,  1], [-1,  1], [1,  1]]
  BLACK_DELTAS = [[0, -1], [-1, -1], [1, -1]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2659 " : " \u265F " )
  end

  def find_possible_moves(game)
    possible_locations = []
    possible_moves = []

    temp_deltas = (color =='w' ? WHITE_DELTAS : BLACK_DELTAS)

    temp_deltas.each do |delta|
      possible_locations << [(loc[0] + delta[0]), (loc[1] + delta[1])]
    end

    in_front = possible_locations.shift
    possible_moves << in_front if game.board[in_front[0]][in_front[1]].nil?

    front_left = possible_locations.shift
    possible_moves << front_left if edible?(front_left, game.board)


    front_right = possible_locations.shift
    possible_moves << front_right if edible?(front_right, game.board)


    @possible_moves = possible_moves
    nil
  end

end