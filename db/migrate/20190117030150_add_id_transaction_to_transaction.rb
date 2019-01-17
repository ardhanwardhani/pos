class AddIdTransactionToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :id_transaction, :string
  end
end
