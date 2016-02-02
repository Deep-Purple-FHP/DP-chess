class Queen < Pieces::Base

  def legal_move(dest_x, dest_y)

    # Determine overall number of horizontal spaces between x origin and x destination
    x_overall_difference = x_overall_diff(dest_x)
      
    # Determine overall number of vertical spaces between y origin and y destination
    y_overall_difference = y_overall_diff(dest_y)


    # Determine if move is a valid horizontal move
    if horizontal_move_validator(dest_x, dest_y)
      return self.horizontal_obstruction_check(dest_x, dest_y, x_overall_difference)

    # Determine if move is a valid vertical move
    elsif vertical_move_validator(dest_x, dest_y)
      return self.vertical_obstruction_check(dest_x, dest_y, y_overall_difference)

    # Determine if move is a valid diagonal move
    elsif diagonal_move_validator(dest_x, dest_y)
      return self.diagonal_obstruction_check(dest_x, dest_y, y_overall_difference)

    # If move is not valid, return "Turn Method"
    else
      return "Turn Method"
    end

  end


end