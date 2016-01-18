class King < Piece 
    def legal_move(dest_x,dest_y)
      
      if (dest_x == self.x_position + 1 && dest_y = self.y_position) || (dest_x == self.x_position - 1 && dest_y = self.y_position) || (dest_y == self.y_position + 1 && dest_x = self.x_position) || (dest_y == self.y_position - 1 && dest_x = self.x_position)
            return true
     # Diagonal Down to Right
        elsif dest_x == self.x_position + 1 && dest_y == self.y_position + 1
            return true
     # Diagonal Up to Right   
        elsif dest_x == self.x_position + 1 && dest_y == self.y_position - 1
            return true
     # Up to Left   
        elsif dest_x == self.x_position - 1 && dest_y == self.y_position - 1
            return true
     # Down to Left
        elsif dest_x == self.x_position - 1 && dest_y == self.y_position + 1
            return true
            
        end
        
    end 
    
end