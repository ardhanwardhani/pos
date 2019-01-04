class CreatePurchaseOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_order_items do |t|
      t.integer :purchase_order_id
      t.integer :amount
      t.integer :unit_price
      t.integer :total
      t.string :itemable_type
      t.integer :itemable_id

      t.timestamps
    end
  end
end
