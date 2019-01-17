class AddOutletIdToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :outlet_id, :integer
  end
end
