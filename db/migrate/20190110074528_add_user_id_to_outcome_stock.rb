class AddUserIdToOutcomeStock < ActiveRecord::Migration[5.1]
  def change
    add_column :outcome_stocks, :user_id, :integer
  end
end
