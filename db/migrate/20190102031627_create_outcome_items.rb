class CreateOutcomeItems < ActiveRecord::Migration[5.1]
  def change
    create_table :outcome_items do |t|
      t.integer :outcome_stock_id
      t.string :amount
      t.string :itemable_type
      t.integer :itemable_id

      t.timestamps
    end
  end
end
