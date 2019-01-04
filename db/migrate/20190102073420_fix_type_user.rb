class FixTypeUser < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :type, :type_user
  end
end
