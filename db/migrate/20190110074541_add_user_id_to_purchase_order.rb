class AddUserIdToPurchaseOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_orders, :user_id, :integer
  end
end
