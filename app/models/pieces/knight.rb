class Pieces::Knight < Pieces::Base 
     def legal_move(dest_x,dest_y)

         # Determine overall number of horizontal spaces between x origin and x destination
         x_overall_difference = x_overall_diff(dest_x)

         # Determine overall number of vertical spaces between y origin and y destination
         y_overall_difference = y_overall_diff(dest_y)

         #Checks to see if the Knight move is valid

         # If y changes by 2 x must change by 1
         if x_overall_difference  == 1 && y_overall_diff == 2
               return true
          # If y changes by 1 then x must change by 2
         elsif x_overall_difference == 2 && y_overall_diff == 1
               return true
          #Return false, not a valid Knight move
         else
               return false

         end



     end


end
