class Piece < ActiveRecord::Base
  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game
    
    
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
