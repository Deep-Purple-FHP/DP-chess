class DashboardsController < ApplicationController
 before_action :authenticate_user!, :only => [:show]
	def show
		@user = User.find(params[:id])
		@games = Game.all
		@opengames = Game.where("games.black_player_id IS NULL")
	end


#private



end
