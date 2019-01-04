class CreateVarians < ActiveRecord::Migration[5.1]
  def change
    create_table :varians do |t|
      t.integer :product_id
      t.string :name
      t.integer :price
      t.string :product_number
      t.string :barcode
      t.string :type_unit
      t.string :status
      t.text :description
      t.string :tax
      t.string :type
      t.integer :category_id

      t.timestamps
    end
  end
end
