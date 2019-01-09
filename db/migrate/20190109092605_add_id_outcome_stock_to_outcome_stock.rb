class AddIdOutcomeStockToOutcomeStock < ActiveRecord::Migration[5.1]
  def change
    add_column :outcome_stocks, :id_outcome_stock, :string
  end
end
