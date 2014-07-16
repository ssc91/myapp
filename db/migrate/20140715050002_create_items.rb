class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :restaurant_id
      t.integer :item_price

      t.timestamps
    end
    add_index :restaurant_id, [:item_name, :restaurant_id]
  end
end
