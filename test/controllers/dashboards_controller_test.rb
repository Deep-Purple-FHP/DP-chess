require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	test "user dashboard " do
		user = FactoryGirl.create(:user)
			sign_in user

		get :show, :id => user.id	
		assert_response :success
    end



end