class Pawn < Piece

    
    #Create the board(need: state of whole game)
    # load all of the pieces of the database
    # Has to have something that creates all of the pieces
    # Have a method that populates all of the pieces 
    # Move method in board(new position, piece)
    # Check obstructions(same piece, same color,capturing, etc)
    # Pawn.move(2,3,board)
    
    
    def first_move(dest_x, dest_y)
         #Deterimine if a pawn is on its original space. 
         
         if self.player_id == "white"
         
             if self.y_position == 6
                 return true
             end
         end
         
         if self.player_id == "black"
            if self.y_position == 1
                return true
            end
        end
        
    end 
    
    # x and y are the destination coordinates gathered from the board index[y][x]
    # Black pieces start at 8A and go down while White pieces go up 1A
    # []
    def legal_move(dest_x,dest_y)
        if self.color == "black"
            if dest_y < self.y_position && self.x_position == dest_x 
                return true
                
            else 
                return false 
            end
        end 
        
        if self.color == "white"
            if dest_y > self.y_position && self.x_position == dest_x 
                return true
                
            else 
                return false 
            end
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