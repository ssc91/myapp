class AddDefaultMigration < ActiveRecord::Migration
  def change
  	add_column :restaurants, :name, :string  
  	add_column :restaurants, :email, :string 
  	add_column :restaurants, :address, :string 
  	add_column :restaurants, :phone, :string
  	add_column :restaurants, :rating, :float, default: 0
  	add_column :restaurants, :rating_count, :integer, default: 0
  end
end
