class Queen < Piece 
    def legal_move(dest_x,dest_y)
       if dest_x < self.x_position or dest_y < self.y_position or dest_x > self.x_position or dest_y < self.y_position
           return true
       else 
            return false
       end
    end
    
    
end 