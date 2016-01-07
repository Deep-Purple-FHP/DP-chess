FactoryGirl.define do
	factory :user do	
		sequence :email do |n|
		 	"b.obrien#{n}@me.com"
		 end
		password '12345678'
		password_confirmation '12345678'
	end

	factory :tour do
		association :user
		name "go go go"
		description "it's fun"
		association :start_location, factory: :address
		association :finish_location, factory: :address
	end

	factory :comment do
		association :user
		association :tour
		message "hula hoop"
		rating '5_star'
	end


	factory :address do
		location "123 Fake Street, Boston, MA, USA"
	end



end