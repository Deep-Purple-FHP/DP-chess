class GamesController < ApplicationController

  def index
    @games = Game.all
  end


  def show
    @game = Game.find(params[:id])

    # @test2 = Piece.new
    # @test2.color = "silver"
    # @test2.x_position = 7
    # @test2.type = "Knight" #bizarre, without this line, show throws an error nilClass
    # @test2.save

    # @test = Pawn.new
    # @test.color = "blue"
    # @test.x_position = 0
    # @test.y_position = 8
    # @test.icon = "white_pawn.png"
    # @test.save

  end

end


private

def game_params
  params.require(:game).permit(:name, :state, :white_player_id, :black_player_id, :winning_player_id)
end
