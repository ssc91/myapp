class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.float :rating
      t.integer :rating_count

      t.timestamps
    end
  end
end
