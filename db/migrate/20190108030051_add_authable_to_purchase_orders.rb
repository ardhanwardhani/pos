class AddAuthableToPurchaseOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_orders, :authable_type, :string
    add_column :purchase_orders, :authable_id, :integer
  end
end
