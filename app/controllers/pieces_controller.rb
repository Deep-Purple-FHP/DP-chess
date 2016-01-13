class PiecesController < ApplicationController

  def update
    # receives AJAX post request with piece_location and piece_destination
    # calls the piece move method to determine if valid
    # true = update view
    # false = return alert (move invalid)
  end

end
