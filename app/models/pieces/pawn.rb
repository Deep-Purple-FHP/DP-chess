class Pieces::Pawn < Pieces::Base

  def valid_move?
    # TODO: Test initial position
    return if new_record?
    return if moved_forward?(1)

    errors.add(:base, 'invalid move')
  end

  def moved_forward?(n = 1)
    return false unless changes['y_position']

    before, after = changes['y_position']
    if black?
      after == before - n
    else
      after == before + n
    end
  end

  def black?
    color == 'purple'
  end

  def first_move(dest_x, dest_y)

    # Determine overall number of horizontal spaces between x origin and x destination
    x_overall_difference = x_overall_diff(dest_x)

    # Determine overall number of vertical spaces between y origin and y destination
    y_overall_difference = y_overall_diff(dest_y)

    if self.color == "white" && self.y_position == 1 && y_overall_difference <= 2
      if vertical_move_validator(dest_x, dest_y)
        return self.vertical_obstruction_check(dest_x, dest_y, y_overall_difference)
      end

      # Pawns can move 2 spaces on their first turn
    elsif self.color == "purple" && self.y_position == 6 && y_overall_difference <= 2
      if vertical_move_validator(dest_x, dest_y)
        return self.vertical_obstruction_check(dest_x, dest_y, y_overall_difference)
      end
    else
      return false
    end
  end

  def legal_move(dest_x,dest_y)
    # Determine overall number of horizontal spaces between x origin and x destination
    x_overall_difference = x_overall_diff(dest_x)

    # Determine overall number of vertical spaces between y origin and y destination
    y_overall_difference = y_overall_diff(dest_y)
    # Determine if move is a valid vertical move

    if vertical_move_validator(dest_x, dest_y)
      return self.vertical_obstruction_check(dest_x, dest_y, y_overall_difference)
    end
  end

  def promote!(type)
    # change piece type
    # can't swap for another pawn or king
    return false unless type == "Queen" || type == "Knight" || type == "Rook" || type == "Bishop"
    # must be on last row on other side of board
    return false unless promote?
    # Returns true if the piece is a pawn and on the opposite side of the board
    if self.piece.type ==  "pawn" && self.piece.color == "white" && self.y_position = 7
      return true
    elsif self.piece.type == "pawn" && self.piece.color == "purple" && self.y_position = 0
      return true
    else
      return false
    end
    self.piece.type = type
    self.set_image
    self.save
    return true
  end
end
