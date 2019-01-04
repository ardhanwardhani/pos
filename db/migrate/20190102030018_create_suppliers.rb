class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
