require 'sinatra'
require "sinatra/activerecord"

set :database, "sqlite3:///coffee_shop_list.db"

get "/" do
	erb :"index"
end	

get "/error" do
  redirect "/error"
end

get "/add-list" do
	@shops_to_visit = CoffeeShop.shops_to_visit
	erb :"add-list"
end

post "/add-list" do
	text = params[:add_coffee_shop]
	if CoffeeShop.add_to_favorite_list(text)
		redirect "/list"
	else
		redirect "/error"
	end
end

post "/delete-list" do
	text = params[:delete_coffee_shop]
	if CoffeeShop.delete_from_favorite_list(text)
		redirect "/list"
	else
		redirect "/error"
	end
end

class CoffeeShop
	@@shops_to_visit = ["Starbucks", "Octane"]
	@@shops_not_to_visit = ["McDonald's", "Dunkin Donuts"]

	def initialize
	end

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