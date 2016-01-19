class Piece < ActiveRecord::Base

  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game

  # def self.subclasses
  #   [Bishop, King, Knight, Pawn, Queen, Rook]
  # end

  # I'm thinking the x,y arrays should be turned into hashes.  Then this table can be searched in reverse.
  # This will be important for the populate board method.
  @location = [
    {'A1': [0,0]}, {'B1': [1,0]}, {'C1': [2,0]}, {'D1': [3,0]}, {'E1': [4,0]}, {'F1': [5,0]}, {'G1': [6,0]}, {'H1': [7,0]},
    {'A2': [0,1]}, {'B2': [1,1]}, {'C2': [2,1]}, {'D2': [3,1]}, {'E2': [4,1]}, {'F2': [5,1]}, {'G2': [6,1]}, {'H1': [7,1]},
    {'A3': [0,2]}, {'B3': [1,2]}, {'C3': [2,2]}, {'D3': [3,2]}, {'E3': [4,2]}, {'F3': [5,2]}, {'G3': [6,2]}, {'H1': [7,2]},
    {'A4': [0,3]}, {'B4': [1,3]}, {'C4': [2,3]}, {'D4': [3,3]}, {'E4': [4,3]}, {'F4': [5,3]}, {'G4': [6,3]}, {'H1': [7,3]},
    {'A5': [0,4]}, {'B5': [1,4]}, {'C5': [2,4]}, {'D5': [3,4]}, {'E5': [4,4]}, {'F5': [5,4]}, {'G5': [6,4]}, {'H1': [7,4]},
    {'A6': [0,5]}, {'B6': [1,5]}, {'C6': [2,5]}, {'D6': [3,5]}, {'E6': [4,5]}, {'F6': [5,5]}, {'G6': [6,5]}, {'H1': [7,5]},
    {'A7': [0,6]}, {'B7': [1,6]}, {'C7': [2,6]}, {'D7': [3,6]}, {'E7': [4,6]}, {'F7': [5,6]}, {'G7': [6,6]}, {'H1': [7,6]},
    {'A8': [0,7]}, {'B8': [1,7]}, {'C8': [2,7]}, {'D8': [3,7]}, {'E8': [4,7]}, {'F8': [5,7]}, {'G8': [6,7]}, {'H1': [7,7]},
  ]

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
    xy_array = @location[origin_cell]
    x = xy_array.fetch(0)
    y = xy_array.fetch(1)


    #then search through all the pieces for a match to determine which piece needs to move.
    Piece.each do |piece|
      if piece.x_position = x  && piece.y_position = y
        return piece.id
      end
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




  def horizontal_move_validator(destination_x, destination_y)

    # If the y coordinate is not constant, the move cannot be horizontal
    if destination_y != self.y_position
      return "Turn Method"
    end

    # The destination cannot be the same as the origin
    if destination_x == self.x_position
      return "Turn Method"
    end

    # Determine the differece between the destination space and the origin space
    x_difference = destination_x - self.x_position

    # Determine overall number of spaces between the destination and origin
    if x_difference < 0
      overall_difference = x_difference * -1
    else
      overall_difference = x_difference
    end

    # Determines X Increment
    x_increment = overall_difference / x_difference

    # Determines number of spaces to iterate through
    # Does not include destination space
    iterations = overall_difference - 1

    # Counter holds value to add to x during each iteration
    x_iteration = x_increment

    # Iterate through each space from origin to destination
    # and ensure the spaces are empty
    iterations.times do
      if board[self.y_position][self.x_position + x_iteration] != nil
        return "Turn Method"
      end
      x_iteration += x_increment
    end

    # If no obstructions, return move method to check contents of destination position
    # relocate piece, possibly capture, and update piece coordinates
    return "Move Go!"

  end


  def diagonal_move_validator(destination_x, destination_y)

    # Determine the difference between x origin and x destination
    x_difference = destination_x - self.x_position

    # Determine the difference between y origin and y destination
    y_difference = destination_y - self.y_position

    # Determine overall number of spaces between origin space and destination space
    if self.y_position - destination_y < 0
      overall_difference = (self.y_position - destination_y) * -1
    else
      overall_difference = self.y_position - destination_y
    end

    # Same as above, but with x.  This needs to be equivelant to overall_difference
    # or move cannot be valid
    if self.x_position - destination_x < 0
      overall_difference = (self.x_position - destination_x) * -1
    else
      x_overall_difference = self.x_position - destination_x
    end

    # Determine if move is a valid diagonal move
    if x_difference == 0 || y_difference == 0 || x_overall_difference != overall_difference
      return "Turn Method"
    end

    # Determines X Increment
    x_increment = overall_difference / x_difference

    # Determines Y Increment
    y_increment = overall_difference / y_difference

    # Determines number of spaces to iterate through
    # Does not include destination space
    iterations = overall_difference - 1

    # Counter holds value to add to x during each iteration
    x_iteration = x_increment
    # Counter holds value to add to y during each iteration
    y_iteration = y_increment

    # Iterate through each space from origin to destination
    # and ensure the spaces are empty
    iterations.times do
      if board[self.y_position + y_iteration][self.x_position + x_iteration] != nil
        return "Turn Method"
      end
      x_iteration += x_increment
      y_iteration += y_increment
    end

    # If no obstructions, return move method to check contents of destination position
    # relocate piece, possibly capture, and update piece coordinates
    return "Move Go!"
  end





end
