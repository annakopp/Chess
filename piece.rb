class Piece
  attr_reader :color, :token, :possible_moves
  attr_accessor :loc, :active
  #attr_writer :possible_moves

  def initialize(color, loc)
    @color = color
    @token = " ? "
    @loc = loc
    @possible_moves = []
    @active = true
  end


  def move(from, to, game)
    board = game.board

    if game.current_player.color != board[from[0]][from[1]].color
      raise
    elsif valid_move?(to, board)
      self.loc = to

      board[from[0]][from[1]] = nil

      board[to[0]][to[1]].active = false if !board[to[0]][to[1]].nil?
      board[to[0]][to[1]] = self
    else
      raise
    end
  end

  def valid_move?(to, board)
    @possible_moves.include?(to)
  end

  def out_of_bounds?(pos)
    !pos[0].between?(0,7) || !pos[1].between?(0,7)
  end

  def edible?(pos, board)
    return false if out_of_bounds?(pos)
    !board[pos[0]][pos[1]].nil? && board[pos[0]][pos[1]].color != color
  end


end