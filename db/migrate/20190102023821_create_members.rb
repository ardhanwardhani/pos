class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.string :name
      t.string :telephone
      t.string :id_member
      t.string :email
      t.string :date_of_birth
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :note

      t.timestamps
    end
  end
end
