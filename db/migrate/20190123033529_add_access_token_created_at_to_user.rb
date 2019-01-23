class AddAccessTokenCreatedAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :access_token_created_at, :datetime
    add_index :users, [:access_token, :access_token_created_at]
  end
end
