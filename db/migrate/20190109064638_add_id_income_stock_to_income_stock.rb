class AddIdIncomeStockToIncomeStock < ActiveRecord::Migration[5.1]
  def change
    add_column :income_stocks, :id_income_stock, :string
  end
end
