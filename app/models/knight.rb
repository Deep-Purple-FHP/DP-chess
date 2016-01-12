class Knight < Piece 
     def legal_move(dest_x,dest_y)
          
          if dest_x == self.x_position + 2 && dest_y == self.y_position - 1
               return true
               
          elsif dest_x == self.x_position + 1 && dest_y == self.y_position - 2 
               return true
               
          elsif dest_x == self.x_position + 2 && dest_y == self.y_position + 1
               return true
               
          elsif dest_x == self.x_position + 1 && dest_y == self.y_position + 2
               return true
               
          elsif dest_x == self.x_position - 2 && dest_y == self.y_position - 1
               return true
          elsif dest_x == self.x_position - 1 && dest_y == self.y_position - 2 
               return true 
               
          elsif dest_x == self.x_position - 2 && dest_y == self.y_position + 1
               return true
               
          elsif dest_x == self.x_position - 1 && dest_y == self.y_position - 2
               return true
          else 
               return false
               
          end 
         
     end
    
    
end