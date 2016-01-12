class Rook < Piece 
    def legal_move(dest_x, dest_y)
        if dest_x >= 0 && dest_y == self.y_position
            return true 
            
        elsif dest_y != self.y_position && dest_x == self.x_position
        
            return true
            
        else 
            return false 
        end
    end 
    
    
end