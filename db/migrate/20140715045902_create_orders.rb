class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :order_list
      t.string :status

      t.timestamps
    end
    add_index :user_id, :restaurant_id, [:user_id, :restaurant_id]
  end
end
