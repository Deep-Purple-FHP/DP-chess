require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
	test "user dashboard" do
		user = FactoryGirl.create(:user)
			sign_in user

		get :show, :id => user.id	
		assert_response :success
    end



end

