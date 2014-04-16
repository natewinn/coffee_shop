require 'sinatra'
require "sinatra/activerecord"

set :database, "sqlite3:///coffee_shop_data.db"

get "/" do
	erb :"index"
end	

get "/error" do
  redirect "/error"
end

get "/coffee_list" do
	@shops_to_visit = CoffeeShop.all
	erb :"coffee_list"
end

get "/coffee_list/:id" do
	@to_visit = CoffeeShop.find(params[:id])
	erb :"/show"
end

post "/coffee_list" do
	coffee_shop = CoffeeShop.new
	coffee_shop.title = params[:title]
	if coffee_shop.save
		redirect "/coffee_list"
	else
		redirect "/error"
	end
end	

delete "/coffee_list/:id" do
  @to_visit = CoffeeShop.find(params[:id]).destroy
  redirect "/coffee_list"
end

class CoffeeShop < ActiveRecord::Base
	# @@shops_to_visit = ["Starbucks", "Octane"]
	# @@shops_not_to_visit = ["McDonald's", "Dunkin Donuts"]



	def self.shops_to_visit
		@@shops_to_visit
	end

	def self.shops_not_to_visit
		@@shops_not_to_visit
	end

	def self.add_to_favorite_list(to_visit)
		if @@shops_not_to_visit.include? to_visit
			return false
		else
			@@shops_to_visit.push(to_visit)
		end
	end

	def self.delete_from_favorite_list(to_visit)
		if @@shops_to_visit.include? to_visit
			@@shops_to_visit.delete(to_visit)
		else
			return false
		end
	end	

end