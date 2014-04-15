require 'rspec'
require './app.rb'

describe CoffeeShops do
	it 'should contain coffee shops to visit' do
		CoffeeShops.shops_to_visit.should_not be_empty
	end

	it 'should add coffee shops to visit'
		first_count = CoffeeShops.shops_to_visit.count
		shops_to_visit = "Inteligensia"
		CoffeeShops.add_to_favorite_list(to_visit)
		second_count = CoffeeShops.add_to_favorite_list.count
		
		second_count.should > first_count
	end
end

	# it 'should not add invalid items to purchase' do
	# 	ShoppingList.items to buy.should_not include 
	# 	meat =""
	# end

it "should not accept invalid text"
to_buy =""
if to_buy.to_s = nil
