class AddUserIdToIncomeStock < ActiveRecord::Migration[5.1]
  def change
    add_column :income_stocks, :user_id, :integer
  end
end
