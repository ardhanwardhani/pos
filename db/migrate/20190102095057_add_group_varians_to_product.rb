class AddGroupVariansToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :group_varians, :string
  end
end
