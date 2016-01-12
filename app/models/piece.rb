class Piece < ActiveRecord::Base
  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game
    
    
    def move(x,y)
        self.x_position = x
        self.y_position = y
        self.save
        
        
    end
    
    
    

	def diagonal_move_validator(destination_x, destination_y)

	# Determine the difference spaces between x origin and x destination
		x_difference = destination_x - self.x_position

	# Determine the difference spaces between y origin and y destination
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

	# Iterate through each space from origin to destination
	# and ensure the spaces are empty
		iterations.times do
			if board[self.y_position + y_increment][self.x_position + x_increment] != nil
				return "Turn Method"
			end
		end

	# If no obstructions, return move method to check contents of destination position
	# relocate piece, possibly capture, and update piece coordinates
		return "Move Go!"
	end
    
    
    
    
    

end
