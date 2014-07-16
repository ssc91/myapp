class Removeratingfromreviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_rating, :float, default: 0
  end
end
