class AddCusNameToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :cus_name, :string
  end
end
