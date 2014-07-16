class AddDefaultValueCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :is_admin, :boolean
  end
end
