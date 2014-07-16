class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.boolean :is_admin

      t.timestamps
    end
  end
end
