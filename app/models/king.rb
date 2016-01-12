class King < Piece 
    def legal_move(dest_x,dest_y)
        if (dest_x > self.x_position) || (dest_x < self.x_position) || (dest_y > self.y_position) || (dest_y < self.y_position)
            return true
        elsif dest_x == self.x_position + 1 && dest_y == self.y_position + 1
            return true
            
        elsif dest_x == self.x_position + 1 && dest_y == self.y_position - 1
            return true
            
        elsif dest_x == self.x_position - 1 && dest_y == self.y_position - 1
            return true
            
        elsif dest_x == self.x_position - 1 && dest_y == self.y_position + 1
            return true
            
        end
        
    end 
    
end