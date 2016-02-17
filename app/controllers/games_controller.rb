class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  private

  def game_params
    params.require(:game).permit(
      :name, :state, :white_player_id, :black_player_id, :winning_player_id)
  end
end
