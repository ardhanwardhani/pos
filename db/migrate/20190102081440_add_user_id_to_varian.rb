class AddUserIdToVarian < ActiveRecord::Migration[5.1]
  def change
    add_column :varians, :user_id, :integer
  end
end
