class CreateOutlets < ActiveRecord::Migration[5.1]
  def change
    create_table :outlets do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.string :city
      t.string :telephone

      t.timestamps
    end
  end
end
