class AddDefaultTotalToTransaction < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :transactions, :total, 0
  end
end