class CreateIncomeStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :income_stocks do |t|
      t.integer :outlet_id
      t.datetime :date
      t.text :note

      t.timestamps
    end
  end
end
