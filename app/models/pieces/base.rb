class Pieces::Base < Piece

  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game

  def convert_string_location_to_coords(str)
    [%w(A B C D E F G H).index(str[0]), (str[1].to_i - 1)]
  end

  # @location_hash = [
  #   {'A1': {0=>0} }, {'B1': {1=>0} }, {'C1': {2=>0} }, {'D1': {3=>0} }, {'E1': {4=>0} }, {'F1': {5=>0} }, {'G1': {6=>0} }, {'H1': {7=>0} },
  #   {'A2': {0=>1} }, {'B2': {1=>1} }, {'C2': {2=>1} }, {'D2': {3=>1} }, {'E2': {4=>1} }, {'F2': {5=>1} }, {'G2': {6=>1} }, {'H2': {7=>1} },
  #   {'A3': {0=>2} }, {'B3': {1=>2} }, {'C3': {2=>2} }, {'D3': {3=>2} }, {'E3': {4=>2} }, {'F3': {5=>2} }, {'G3': {6=>2} }, {'H3': {7=>2} },
  #   {'A4': {0=>3} }, {'B4': {1=>3} }, {'C4': {2=>3} }, {'D4': {3=>3} }, {'E4': {4=>3} }, {'F4': {5=>3} }, {'G4': {6=>3} }, {'H4': {7=>3} },
  #   {'A5': {0=>4} }, {'B5': {1=>4} }, {'C5': {2=>4} }, {'D5': {3=>4} }, {'E5': {4=>4} }, {'F5': {5=>4} }, {'G5': {6=>4} }, {'H5': {7=>4} },
  #   {'A6': {0=>5} }, {'B6': {1=>5} }, {'C6': {2=>5} }, {'D6': {3=>5} }, {'E6': {4=>5} }, {'F6': {5=>5} }, {'G6': {6=>5} }, {'H6': {7=>5} },
  #   {'A7': {0=>6} }, {'B7': {1=>6} }, {'C7': {2=>6} }, {'D7': {3=>6} }, {'E7': {4=>6} }, {'F7': {5=>6} }, {'G7': {6=>6} }, {'H7': {7=>6} },
  #   {'A8': {0=>7} }, {'B8': {1=>7} }, {'C8': {2=>7} }, {'D8': {3=>7} }, {'E8': {4=>7} }, {'F8': {5=>7} }, {'G8': {6=>7} }, {'H8': {7=>7} },
  # ]

  def find_piece(origin_cell)
    #this method should be passed the cell_ID of the piece the user selects via jQuery AJAX post request

    #then translate the cell_ID to x,y co-ordinates
    xy_array = convert_string_location_to_coords(origin_cell)
    x = xy_array.fetch(0)
    y = xy_array.fetch(1)


    #then search through all the pieces for a match to determine which piece needs to move.
    game.pieces.find_by(x_position: x, y_position: y).pluck(:id)
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
