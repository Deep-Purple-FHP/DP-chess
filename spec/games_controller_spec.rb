require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#create action" do
    it "successfully creates a game" do
      post :create, :game => {:name => 'test', :state => "noidea", :white_player_id => 1, :black_player_id => 2, :winning_player_id => ""}
      expect(response).to redirect_to game_path(Game.last)

      game = Game.last
      expect(game.name).to eq("test")
    end
  end
end
