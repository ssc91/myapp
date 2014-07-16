class ModifyRestaurant < ActiveRecord::Migration
  remove_column :restaurants, :name, :string, :email, :string, :address, :string, :phone, :string, :rating, :float, :rating_count, :integer
  
end
