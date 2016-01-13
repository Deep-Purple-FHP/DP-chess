class PiecesController < ApplicationController

  def update
    piece_location = pieceLocation
    render :json => {}, :status => 500
    # receives AJAX post request with piece_location and piece_destination
    # calls the piece move method to determine if valid
    # true = update view
    # false = return alert (move invalid)

  end


  # def create
  #   @sub_comment = SubComment.new params['subcomment']
  #   if @sub_comment.save
  #     render :json => { } # send back any data if necessary
  #   else
  #     render :json => { }, :status => 500
  #   end
  # end
