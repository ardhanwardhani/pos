class AddUserIdToSupplier < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :user_id, :integer
  end
end
