class Rook < Piece

  def initialize(color)
    super(color)
    @token = "R"
  end

  def valid_move?(from, to, board)
    return false if (from.x != to.x) && (from.y != to.y)

    if to.x > from.x
      i = progress("right", from, board)
      can_reach = (from.x + i >= to.x)
    elsif to.x < from.x
      i = progress("left", from, board)
      can_reach = (from.x - i <= to.x)
    elsif to.y > from.y
      i = progress("up", from, board)
      can_reach = (from.y + i >= to.y)
    elsif to.y < from.y
      i = progress("down", from, board)
      can_reach = (from.y - i <= to.y)
    end

    if to.piece.nil?
      can_reach
    elsif to.piece.color != self.color
      can_reach
    else
      false
    end

  end

  def progress(dir, from, board)
    i = 1
    case dir
    when "right"
      while (from.x + i < 8) && board[from.x + i][from.y].piece.nil?
        i += 1
      end
    when "left"
      while (from.x - i >= 0) && board[from.x - i][from.y].piece.nil?
        i += 1
      end
    when "up"
      while (from.y + i < 8) && board[from.x][from.y + i].piece.nil?
        i += 1
      end
    when "down"
      while (from.y - i >= 0) && board[from.x][from.y - i].piece.nil?
        i += 1
      end
    end
    i
  end


=begin
  def valid_move?(move_from, move_to, board)
    possible_locations = []
    DELTAS.each do |delta|
      dx = move_from.x + delta[0]
      dy = move_from.y + delta[1]
      next if ( dx.between?(0, 7) || dy.between?(0, 7) )

      possible_locations << [dx, dy]
    end

    possible_tiles = possible_locations.map do |location|
      board[location[0]][location[1]]
    end



    if (move_to == possible_tiles.first) && move_to.piece.nil?
      return true
    elsif possible_tiles.include?(move_to) && !move_to.piece.nil?
      if move_to.piece.color != self.color
        return true
      end
    end

    false
  end
=end


end