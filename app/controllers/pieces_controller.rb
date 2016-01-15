class PiecesController < ApplicationController

  def update
    @origin_cell = pieceLocation
    @destination_cell = pieceDestination
    Piece.find_piece(origin_cell)






    # receives AJAX post request with piece_location and piece_destination
    # calls the piece move method to determine if valid
    # true = update view
    # false = return alert (move invalid)

  end

  # From SO:  http://stackoverflow.com/questions/7237720/jquery-post-to-rails
  # def create
  #   @sub_comment = SubComment.new params['subcomment']
  #   if @sub_comment.save
  #     render :json => { } # send back any data if necessary
  #   else
  #     render :json => { }, :status => 500
  #   end
  # end
