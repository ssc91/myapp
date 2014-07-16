class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.float :user_rating
      t.text :user_feedback

      t.timestamps
    end
    add_index :restaurant_id
  end
end
