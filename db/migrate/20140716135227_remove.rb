class Remove < ActiveRecord::Migration
  def change
    remove_column :restaurants, :rating, :float 
    remove_column :restaurants, :rating_count, :integer 
  end
end
