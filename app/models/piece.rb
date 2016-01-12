class Piece < ActiveRecord::Base
  # Piece < Player < Game < Active Record
  belongs_to :player
  belongs_to :game
    
    
    def move(x,y)
        self.x_position = x
        self.y_position = y
        self.save
        
        
    end
    
    
    
    
    
    
    
    

end
