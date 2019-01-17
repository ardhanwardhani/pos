class AddOperatorableToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :operatorable_type, :string
    add_column :transactions, :operatorable_id, :integer
  end
end
