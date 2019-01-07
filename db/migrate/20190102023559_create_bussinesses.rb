class CreateBussinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :bussinesses do |t|
      t.integer :user_id
      t.string :name
      t.string :telephone
      t.string :province
      t.string :city
      t.string :type

      t.timestamps
    end
  end
end
