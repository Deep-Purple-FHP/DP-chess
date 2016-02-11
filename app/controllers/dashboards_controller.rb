class DashboardsController < ApplicationController
 before_action :authenticate_user!, :only => [:show]
	def show
		@games = Game.all
		@opengames = Game.where("games.black_player_id IS NULL")
	end


end
