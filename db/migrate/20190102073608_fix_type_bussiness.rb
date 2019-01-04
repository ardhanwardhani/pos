class FixTypeBussiness < ActiveRecord::Migration[5.1]
  def change
  	rename_column :bussinesses, :type, :type_bussiness
  end
end
