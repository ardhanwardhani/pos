class CreateIncomeItems < ActiveRecord::Migration[5.1]
  def change
    create_table :income_items do |t|
      t.integer :income_stock_id
      t.string :itemable_type
      t.integer :itemable_id
      t.integer :amount
      t.integer :unit_price
      t.integer :total

      t.timestamps
    end
  end
end
