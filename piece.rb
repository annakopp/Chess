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
      raise NotYourTurnError.new "not your turn"
    elsif valid_move?(to, board)
      self.loc = to

      board[from[0]][from[1]] = nil

      temp = board[to[0]][to[1]]

      board[to[0]][to[1]].active = false if !board[to[0]][to[1]].nil?
      board[to[0]][to[1]] = self

      game.update_possible_moves

      #game.print_board

      if game.check?
        undo(from, temp, game)

        #game.print_board

        raise KingInCheckError.new "king's in check"
      end
    else
      raise InvalidMoveError.new "invalid move"
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



  def undo(old_l, temp, game)
    board = game.board

    new_l = self.loc.dup
    self.loc = old_l

    board[old_l[0]][old_l[1]] = self

    temp.active = true if !temp.nil?
    board[new_l[0]][new_l[1]] = temp

    game.update_possible_moves
  end






end