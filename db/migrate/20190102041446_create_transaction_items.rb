class CreateTransactionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_items do |t|
      t.integer :transaction_id
      t.string :itemable_type
      t.integer :itemable_id
      t.string :amount_unit

      t.timestamps
    end
  end
end
