class Pieces::Base < Piece

  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game

  def convert_string_location_to_coords(str)
    [%w(A B C D E F G H).index(str[0]), (str[1].to_i - 1)]
  end


  def display_piece(origin_cell)
    # game.pieces.find_by(x_position: x, y_position: y).pluck(:id)
    occupant = game.pieces.find_by(x_position: x, y_position: y)
      if occupant != nil
        image_tag occupant.icon
      end
  end

  def capture

    piece(id).x_position = -1000
    piece(id).y_position = -1000

  end

  def is_obstructed?
    #  select target location for move
    # define the 'array' of board locations from a -> b
    # query  all the pieces x,y locations, do any of them match?
    #   if yes, then disallowed
    #   if no, move piece
  end



  def move(x,y)
    self.x_position = x
    self.y_position = y
    self.save


  end

  def vertical_obstruction_check(destination_x, destination_y, overall_difference)

    # Determine the differece between the destination space and the origin space
    y_difference = destination_y - self.y_position

    # Determines Y Increment
    y_increment = overall_difference / y_difference

    # Determines number of spaces to iterate through
    # Does not include destination space
    iterations = overall_difference - 1

    # Counter holds value to add to y during each iteration
    y_iteration_count = y_increment

    # Iterate through each space from origin to destination
    # and ensure the spaces are empty
    iterations.times do
        # nil will be replaced with placeholder piece
      if board[self.y_position + y_iteration_count][self.x_position] != nil
        return "Turn Method"
      end
      y_iteration_count += y_increment
    end

    # If no obstructions, return move method to check contents of destination position
    # relocate piece, possibly capture, and update piece coordinates
    return "Move Go!"

  end

  def horizontal_obstruction_check(destination_x, destination_y, overall_difference)

    # Determine the differece between the destination space and the origin space
    x_difference = destination_x - self.x_position

    # Determines X Increment
    x_increment = overall_difference / x_difference

    # Determines number of spaces to iterate through
    # Does not include destination space
    iterations = overall_difference - 1

    # Counter holds value to add to x during each iteration
    x_iteration_count = x_increment

    # Iterate through each space from origin to destination
    # and ensure the spaces are empty
    iterations.times do
        # nil will be replaced with placeholder piece
      if board[self.y_position][self.x_position + x_iteration_count] != nil
        return "Turn Method"
      end
      x_iteration_count += x_increment
    end

    # If no obstructions, return move method to check contents of destination position
    # relocate piece, possibly capture, and update piece coordinates
    return "Move Go!"

  end


  def diagonal_obstruction_check(destination_x, destination_y, overall_difference)

    # Determine the difference between x origin and x destination
    x_difference = destination_x - self.x_position

    # Determine the difference between y origin and y destination
    y_difference = destination_y - self.y_position

    # Determines X Increment
    x_increment = overall_difference / x_difference

    # Determines Y Increment
    y_increment = overall_difference / y_difference

    # Determines number of spaces to iterate through
    # Does not include destination space
    iterations = overall_difference - 1

    # Counter holds value to add to x during each iteration
    x_iteration_count = x_increment
    # Counter holds value to add to y during each iteration
    y_iteration_count = y_increment

    # Iterate through each space from origin to destination
    # and ensure the spaces are empty
    iterations.times do
      # nil will be replaced with placeholder piece
      if board[self.y_position + y_iteration_count][self.x_position + x_iteration_count] != nil
        return "Turn Method"
      end
      x_iteration_count += x_increment
      y_iteration_count += y_increment
    end

    # If no obstructions, return move method to check contents of destination position
    # relocate piece, possibly capture, and update piece coordinates
    return "Move Go!"
  end

  # Determine if move is a valid horizontal move
  def horizontal_move_validator(destination_x, destination_y)
      if destination_y == self.y_position && destination_x != self.x_postion
        return true
      else
        return false
      end
  end

  # Determine if move is a valid vertical move
  def vertical_move_validator(destination_x, destination_y)
      if destination_x == self.x_position && destination_y != self.y_postion
        return true
      else
        return false
      end
  end

  # Determine if move is a valid diagonal move
  def diagonal_move_validator(destination_x, destination_y)
      if y_overall_difference == x_overall_difference && y_overall_difference != 0
        return true
      else
        return false
      end
    end

    # Determine overall number of horizontal spaces between x origin and x destination
    def x_overall_diff(x_destination)
      if x_destination - self.x_position > 0
        return x_destination - self.x_position
      else
        return (x_destination - self.x_position) * -1
      end
    end

    # Determine overall number of vertical spaces between y origin and y destination
    def y_overall_diff(y_destination)
      if y_destination - self.y_position > 0
        return y_destination - self.y_position
      else
        return (y_destination - self.y_position) * -1
      end
  end





end
