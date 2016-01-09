class DashboardsController < ApplicationController
 before_action :authenticate_user!, :only => [:show]
	def show
		@user = User.find(params[:id])
		@games = Game.all
	end


#private



end
