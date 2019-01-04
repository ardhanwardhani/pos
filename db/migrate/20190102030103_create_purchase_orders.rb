class CreatePurchaseOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_orders do |t|
      t.integer :outlet_id
      t.integer :supplier_id
      t.string :no_po
      t.text :note

      t.timestamps
    end
  end
end
