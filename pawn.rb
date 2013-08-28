class Pawn < Piece
  attr_reader :birthplace

  WHITE_DELTAS = [[0,  1], [-1,  1], [1,  1], [0,  2]]
  BLACK_DELTAS = [[0, -1], [-1, -1], [1, -1], [0, -2]]

  def initialize(color, loc)
    super(color, loc)
    @token = (color =="w" ? " \u2659 " : " \u265F " )
    @birthplace = loc.dup
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

    first_move = possible_locations.shift
    possible_moves << first_move if possible_moves.include?(in_front) &&
      (game.board[first_move[0]][first_move[1]].nil?) && (@birthplace == @loc)

    @possible_moves = possible_moves
    nil
  end

end