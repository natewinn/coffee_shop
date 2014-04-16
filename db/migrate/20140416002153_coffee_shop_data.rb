class CoffeeShopData < ActiveRecord::Migration
  def change
  	create_table :coffee_shops do |t|
  		t.string :title
  		t.string :description
  		t.timestamps
  	end
  	CoffeeShop.create(title: "Starbucks", description: "Great Coffee")
  	CoffeeShop.create(title: "Octane", description: "Nice Atmosphere")
  	
  end
end
