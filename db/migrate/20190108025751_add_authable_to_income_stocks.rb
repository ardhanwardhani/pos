class AddAuthableToIncomeStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :income_stocks, :authable_type, :string
    add_column :income_stocks, :authable_id, :integer
  end
end
