class AddCuisineAndTimings < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine, :string 
    add_column :restaurants, :timings, :string
  end
end
